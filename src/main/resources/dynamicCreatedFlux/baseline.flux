filesize    = "10000";
records     = "20000";
compress    = "false";
extension   = "jsonld";

"/swissbib_index/lsbPlatform/data/createFolderTemp"|
read-dir|
open-file|
catch-object-exception|
decode-xml|
handle-marcxml|
filter("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/245aFilter.xml")|
stream-tee| {
    change-id("245*.a")|
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/resourceMorph.xml")|
    change-id|
    encode-esbulk(escapeChars="true", header="true", index="lsb_20170710", type="bibliographicResource")|
    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
}{
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/documentMorph.xml")|
    change-id|
    encode-esbulk(escapeChars="true", header="true", index="lsb_20170710", type="document")|
    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
}{
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/itemMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk(escapeChars="true", header="true", index="lsb_20170710", type="item")|
    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
}{
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/organisationMorph.xml")|
    split-entities|
    change-id|
    lookup-es(esClustername="linked-swissbib", esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esIndex="lsb_20170710", esType="organisation")|
    encode-esbulk(escapeChars="true", header="false", index="lsb_20170710", type="organisation")|
    write-esbulk(baseOutDir="/swissbib_index/lsbPlatform/data/enrichedLineInput", fileSize=filesize, jsonCompliant="true", type="organisation", compress=compress, extension=extension)
}{
    change-id("245*.a")|
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/personMorph.xml")|
    split-entities|
    change-id|
    lookup-es(esClustername="linked-swissbib", esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esIndex="lsb_20170710", esType="person")|
    encode-esbulk(escapeChars="true", header="false", index="lsb_20170710", type="person")|
    write-esbulk(baseOutDir="/swissbib_index/lsbPlatform/data/enrichedLineInput", fileSize=filesize, jsonCompliant="true", type="person", compress=compress, extension=extension)
//}{
//    filter("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/workFilter.xml")|
//    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/workMorph1.xml")|
//    stream-to-triples(redirect="true")|
//    sort-triples(by="all")|
//    collect-triples|
//    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/workMorph2.xml")|
//    split-entities|
//    encode-esbulk(escapeChars="true", header="true", index="lsb_20170710", type="work")|
//    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
};
