$NetBSD$

Use pkgsrc layout.

--- config/config.go.orig	2022-02-16 20:34:52.000000000 +0000
+++ config/config.go
@@ -730,7 +730,7 @@ func (c *Config) LoadDirectory(path stri
 func getDefaultConfigPath() (string, error) {
 	envfile := os.Getenv("TELEGRAF_CONFIG_PATH")
 	homefile := os.ExpandEnv("${HOME}/.telegraf/telegraf.conf")
-	etcfile := "/etc/telegraf/telegraf.conf"
+	etcfile := "@PKG_SYSCONFDIR@/telegraf.conf"
 	if runtime.GOOS == "windows" {
 		programFiles := os.Getenv("ProgramFiles")
 		if programFiles == "" { // Should never happen
