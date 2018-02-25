outdirperson      = FLUX_DIR + "/data.out";

FLUX_DIR + "/data.in" |
read-dir|
//open-gzip|
open-file|
catch-object-exception|
decode-xml|
handle-marcxml|
filter("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/245aFilter.xml")|
change-id("245*.a")|
morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/personMorph.xml")|
split-entities|
change-id|
encode-formeta (style="MULTILINE")|
write("stdout");
