outdir      = "/data/sbdump/outputBulkJson";
filesize    = "10000";
records     = "5000";
bulkheader      = "true";
index = "testsb_151117";
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
object-tee| {
    filter-triples(subjectpattern="http://viaf.org/.*")|
    collect-triples|
    morph(FLUX_DIR + "viafMorphDecode.xml")|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="viaf")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
} {
    filter-triples(subjectpattern="http://data.swissbib.*")|
    collect-triples|
    morph(FLUX_DIR + "personMorphDecode.xml")|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
};
