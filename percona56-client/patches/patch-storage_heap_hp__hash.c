$NetBSD: patch-storage_heap_hp__hash.c,v 1.1 2013/04/29 21:16:57 joerg Exp $

--- storage/heap/hp_hash.c.orig	2013-06-26 20:38:20.000000000 +0000
+++ storage/heap/hp_hash.c
@@ -605,7 +605,7 @@ int hp_key_cmp(HP_KEYDEF *keydef, const
   {
     if (seg->null_bit)
     {
-      int found_null=test(rec[seg->null_pos] & seg->null_bit);
+      int found_null=my_test(rec[seg->null_pos] & seg->null_bit);
       if (found_null != (int) *key++)
 	return 1;
       if (found_null)
@@ -721,7 +721,7 @@ void hp_make_key(HP_KEYDEF *keydef, ucha
     uint char_length= seg->length;
     const uchar *pos= rec + seg->start;
     if (seg->null_bit)
-      *key++= test(rec[seg->null_pos] & seg->null_bit);
+      *key++= my_test(rec[seg->null_pos] & seg->null_bit);
 
     if (seg->flag & HA_BLOB_PART)
     {
@@ -773,7 +773,7 @@ uint hp_rb_make_key(HP_KEYDEF *keydef, u
     uint char_length;
     if (seg->null_bit)
     {
-      if (!(*key++= 1 - test(rec[seg->null_pos] & seg->null_bit)))
+      if (!(*key++= 1 - my_test(rec[seg->null_pos] & seg->null_bit)))
         continue;
     }
     if (seg->flag & HA_SWAP_KEY)
