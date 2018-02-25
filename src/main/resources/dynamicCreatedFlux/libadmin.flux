"https://www.swissbib.ch/mapportal.json"|
open-http(encoding="UTF-8")|
//vorher war - was ist korrekt?
//read-json
read-json-object|
morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/libadminMorph.xml")|
split-entities|
change-id|
encode-esbulk(escapeChars="false", header="true", index="lsb_20170710", type="organisation")|
index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload="100");