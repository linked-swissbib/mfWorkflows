filesize    = "10000";
records     = "20000";
compress    = "false";
extension   = "jsonld";

default in = FLUX_DIR + "data/test1.xml";
default filterMorph = FLUX_DIR + "/../transformation/indexWorkflows/245aFilter.xml";
default resourceMorph = FLUX_DIR + "/../transformation/indexWorkflows/resourceMorph.xml";
default out = "stdout";


in |
open-file|
catch-object-exception|
decode-xml|
handle-marcxml|
filter(filterMorph)|
change-id(idLiteral="245*.a")|
morph(resourceMorph)|
change-id|
encode-formeta(style="multiline")|
write(out);
//encode-esbulk(escapeChars="true", header="true", index="lsb_20170710", type="bibliographicResource")|
//index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
