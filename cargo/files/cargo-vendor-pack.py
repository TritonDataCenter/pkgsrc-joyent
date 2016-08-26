#!/usr/bin/env python

# Copyright: 2015 The Debian Project
# License: MIT-License or Apache-2.0
#
# Helper to generate a crate registry from local unpacked crates
# TODO: very bad code. It should be rewritten in perl and converted into dh_cargo

import json
import os
import tarfile
import string
import pytoml
from dulwich.repo import Repo
import hashlib
from collections import OrderedDict


# TODO: hackish, at best. features need to be properly parsed
def parse_deps(toml):
  deps=[]
  if 'dependencies' not in toml:
    return deps
  d = toml['dependencies']
  if 'target' in toml:
    t = toml['target']
    if 'x86_64-unknown-linux-gnu' in t:
      t = t['x86_64-unknown-linux-gnu']
      if 'dependencies' in t:
        d.update(t['dependencies'])
  for k, v in d.iteritems():
    opt = False
    defa = True
    if isinstance(v, dict):
      opt = v.get('optional', opt)
      v = '*'
    i = {
      "default_features": defa,
      "features": [],
      "kind": "normal",
      "name": k,
      "optional": opt,
      "req": v,
      "target": None
    }
    deps.append(i)
  if 'build-dependencies' not in toml:
    return deps
  d = toml['build-dependencies']
  for k, v in d.iteritems():
    opt = False
    defa = True
    if isinstance(v, dict):
      opt = v.get('optional', opt)
      v = '*'
    i = {
      "default_features": defa,
      "features": [],
      "kind": "build",
      "name": k,
      "optional": opt,
      "req": v,
      "target": None
    }
    deps.append(i)
  if 'dev-dependencies' not in toml:
    return deps
  d = toml['dev-dependencies']
  for k, v in d.iteritems():
    opt = False
    defa = True
    if isinstance(v, dict):
      opt = v.get('optional', opt)
      v = '*'
    i = {
      "default_features": defa,
      "features": [],
      "kind": "dev",
      "name": k,
      "optional": opt,
      "req": v,
      "target": None
    }
    deps.append(i)
  return deps

def main():
  curdir = os.getcwd()
  depsdir = os.path.join(curdir, "deps")
  vendordir = os.path.join(curdir, "vendor")
  cachedir = os.path.join(vendordir, "cache")
  indexdir = os.path.join(vendordir, "index")
  cargocfgdir = os.path.join(curdir, ".cargo")
  for d in [cachedir, indexdir]:
    if not os.path.exists(d):
      os.makedirs(d)

  indexdict = OrderedDict()
  for crate in os.listdir(depsdir):
    if os.path.isdir(os.path.join(depsdir, crate)) and not crate.startswith('.'):
      (name, ver) = string.rsplit(crate, '-', 1)
      print("Found %s ver. %s (at %s)" % (name, ver, os.path.join(depsdir, crate)))
      destdir=(os.path.join(cachedir, name, ver))
      os.makedirs(destdir)
      tarcrate = os.path.join(destdir, "download")
      tar = tarfile.open(tarcrate, "w:gz", format=tarfile.USTAR_FORMAT)
      tar.add(os.path.join(depsdir, crate), arcname=crate)
      tar.close()

      manif = None
      with open(os.path.join(depsdir,crate,'Cargo.toml'), 'rb') as f:
        manif = pytoml.load(f)

      nestdir = None
      if len(name) >= 4:
        nestdir = os.path.join(indexdir, name[0:2], name[2:4])
      else:
        nestdir = os.path.join(indexdir, '3', name[0])

      cksum = hashlib.sha256(open(tarcrate, 'rb').read()).hexdigest()
      indexdict[name] = OrderedDict([ 
        ('name', name),
        ('vers', ver),
        ('deps', parse_deps(manif)),
        ('features', manif.get('features',{})),
        ('cksum', cksum),
        ('yanked', False)
      ])
      if not os.path.exists(nestdir):
        os.makedirs(nestdir)
      with open(os.path.join(nestdir, name), 'a') as outfile:
        json.dump(indexdict[name], outfile, sort_keys=False)
        outfile.write('\n')
      

  configjson = {
    'api': '',
    'dl': "file://{0}".format(cachedir)
  }
  with open(os.path.join(indexdir, 'config.json'), 'w') as outfile:
    json.dump(configjson, outfile)

  p = []
  for dirpath, _, paths in os.walk(indexdir): 
    for f in paths:
      p.append(os.path.relpath(os.path.join(dirpath,f), indexdir))
 
  repo=Repo.init(indexdir)
  for f in paths:
    repo.stage(p)
  repo.do_commit(b"Fake commit", committer=b"Cargo debhelper <pkg-rust-maintainers@lists.alioth.debian.org>")

  cfg="""[registry]
index = "file://{0}"
"""
  if not os.path.exists(cargocfgdir):
    os.makedirs(cargocfgdir)

  with open(os.path.join(cargocfgdir, "config"), "w") as cfgfile:
    cfgfile.write(cfg.format(indexdir))

if __name__ == "__main__":
  main()
