//	"https://www.swissbib.ch/mapportal.json"|
"http://libadmin.ch/api/vufind/green.json?option[all]=true" |
open-http(encoding="UTF-8")|
//"/home/swissbib/Schreibtisch/green.formeta.txt" |
//open-file |
//as-formeta-records |
//decode-formeta|
read-json |
morph("/usr/local/swissbib/mfWorkflows.mitTempDateien/src/main/resources/gh/libaminMail/libadminMail.xml")|
split-entities|
//encode-formeta (style="multiline") |
//encode-literals |
encode-json |
write("mails.for.silvia.json");