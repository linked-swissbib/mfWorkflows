outdir      = "/data/sbdump/test";
filesize    = "10000";
records     = "5000";
bulkheader      = "true";
index = "testsb_151208";
jsoncompliant = "false";
file = "/data/sbdump/swissbib_persons_final.nt";

esnodes     = "localhost:9300";
escluster   = "elasticsearch";

file|
open-file|
decode-ntriples(unicodeEscapeSeq="true")|
stream-to-triples(redirect="true")|
sort-triples(by="all")|
filter-duplicate-objects|
collect-triples|
morph(FLUX_DIR + "morphDecode.xml")|
stream-tee| {
    filter(FLUX_DIR + "viafFilter.xml")|
    change-id(idname="id")|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="viaf")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
} {
    filter(FLUX_DIR + "personFilter.xml")|
    change-id(idname="id")|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
};
