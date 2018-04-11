//convert json to csv or excel http://www.convertcsv.com/json-to-csv.htm

//	"https://www.swissbib.ch/mapportal.json"|
outdirbib = FLUX_DIR + "/data";
"http://libadmin.ch/api/vufind/green.json?option[all]=true" |
open-http(encoding="UTF-8")|
//"/home/swissbib/Schreibtisch/green.formeta.txt" |
//open-file |
//as-formeta-records |
//decode-formeta|
read-json |
morph(FLUX_DIR + "/libadminMail.xml")|
split-entities|
//encode-formeta (style="multiline") |
//encode-literals |
//encode-json |
//write("mails.for.silvia.json");

encode-esbulk(escapeChars="true", header="false")|
write-esbulk(jsonCompliant="true", compress="false", type="mail", extension="json", baseOutDir=outdirbib, fileSize="1000");

