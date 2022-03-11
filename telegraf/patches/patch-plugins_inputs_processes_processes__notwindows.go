$NetBSD$

Support illumos processes.

--- plugins/inputs/processes/processes_notwindows.go.orig	2022-02-16 20:34:52.000000000 +0000
+++ plugins/inputs/processes/processes_notwindows.go
@@ -82,6 +82,9 @@ func getEmptyFields() map[string]interfa
 		fields["paging"] = int64(0)
 		fields["total_threads"] = int64(0)
 		fields["idle"] = int64(0)
+	case "illumos", "solaris":
+		fields["wait"] = int64(0)
+		fields["runnable"] = int64(0)
 	}
 	return fields
 }
@@ -110,8 +113,15 @@ func (p *Processes) gatherFromPS(fields
 			fields["dead"] = fields["dead"].(int64) + int64(1)
 		case 'T':
 			fields["stopped"] = fields["stopped"].(int64) + int64(1)
-		case 'R':
+		case 'O':
 			fields["running"] = fields["running"].(int64) + int64(1)
+		case 'R':
+			switch runtime.GOOS {
+			case "illumos", "solaris":
+				fields["runnable"] = fields["runnable"].(int64) + int64(1)
+			default:
+				fields["running"] = fields["running"].(int64) + int64(1)
+			}
 		case 'S':
 			fields["sleeping"] = fields["sleeping"].(int64) + int64(1)
 		case 'I':
@@ -215,7 +225,13 @@ func execPS() ([]byte, error) {
 		return nil, err
 	}
 
-	out, err := exec.Command(bin, "axo", "state").Output()
+	var out []byte
+	switch runtime.GOOS {
+	case "illumos", "solaris":
+		out, err = exec.Command(bin, "-eo", "s").Output()
+	default:
+		out, err = exec.Command(bin, "axo", "state").Output()
+	}
 	if err != nil {
 		return nil, err
 	}
