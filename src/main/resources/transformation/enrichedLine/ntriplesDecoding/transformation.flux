outdir      = "/data/mfdumps/enrichedLineOutput";
filesize    = "10000";
records     = "5000";
bulkheader      = "true";
index = "testsb_160406";
jsoncompliant = "false";
file = "/data/sbdump/swissbib_persons_enriched_20160322.nt";

esnodes     = "localhost:9300";
escluster   = "elasticsearch";

file|
open-file|
decode-ntriples(unicodeEscapeSeq="true")|
stream-to-triples(redirect="true")|
sort-triples(by="all")|
filter-duplicate-objects|
collect-triples|
morph(FLUX_DIR + "personMorph.xml")|
change-id(idname="id")|
encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
//write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="person");
index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records);
