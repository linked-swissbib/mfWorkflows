records="20000";
header="true";
escapechars="true";

"/swissbib_index/linking/data/swissbib_out_sorted.nt"|
open-file|
decode-ntriples(unicodeEscapeSeq="true")|
stream-to-triples(redirect="true")|
collect-triples|
stream-tee| {
    filter("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/enrichedPersonFilter.xml")|
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/enrichedPersonMorph.xml")|
    change-id(idname="id")|
    encode-esbulk(escapeChars=escapechars, header=header, index="lsb_20170710", type="person")|
    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
}{
    filter("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/enrichedOrganisationFilter.xml")|
    morph("/usr/local/swissbib/mfWorkflows/src/main/resources/transformation/indexWorkflows/enrichedOrganisationMorph.xml")|
    change-id(idname="id")|
    encode-esbulk(escapeChars=escapechars, header=header, index="lsb_20170710", type="organisation")|
    index-esbulk(esNodes="sb-ues1:9300#sb-ues2:9300#sb-ues3:9300", esClustername="linked-swissbib", recordsPerUpload=records)
};
