outdir      = "/data/mfdumps/enrichedLineOutput";
filesize    = "10000";
records     = "5000";
bulkheader      = "true";
index = "testsb_160407";
jsoncompliant = "false";
file = "/data/sbdump/swissbib_persons_enriched_20160322.nt";
subdirsize  = "1000";
compress    = "true";
extension   = "jsonld";

esnodes     = "localhost:9300";
//esnodes     = "sb-s2.swissbib.unibas.ch:9300#sb-s6.swissbib.unibas.ch:9300#sb-s7.swissbib.unibas.ch:9300";
escluster   = "linked-swissbib";

file|
open-file|
decode-ntriples(unicodeEscapeSeq="true")|
stream-to-triples(redirect="true")|
collect-triples|
morph(FLUX_DIR + "ntriplesMorph.xml")|
change-id(idname="id")|
encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
//write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="person", subdirSize=subdirsize, compress=compress, extension=extension);
index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records);
