indir       = "/home/seb/tmp/marcDataMF";
outdir      = "/home/seb/tmp/test";
//file        = FLUX_DIR + "../resource/correctMarcXML.xml";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
index       = "test1";
subdirsize  = "1000";
bulkheader  = "false";
jsoncompliant = "true";
compress    = "true";
extension   = "jsonld";

indir|
read-dir|
//file|
open-gzip|
decode-xml|
handle-marcxml|
filter(FLUX_DIR + "filter.xml")|
morph(FLUX_DIR + "morph.xml")|
change-id|
stream-to-triples(redirect="true")|
count-triples(countby="OBJECT")|
template("${s},${o}")|
write("/home/seb/tmp/countSources.txt");
//collect-triples|
//encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
//write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="source", subdirSize=subdirsize, compress=compress, extension=extension);
