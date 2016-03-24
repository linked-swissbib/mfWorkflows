indir       = "/data/sbdump/marcDataMF";
outdir      = "/data/sbdump/enrichedLineInput";
//file        = FLUX_DIR + "../resource/correctMarcXML.xml";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
index       = "testsb_160120";
subdirsize  = "1000";
bulkheader  = "false";
jsoncompliant = "true";
compress    = "true";
extension   = "jsonld";
esname      = "elasticsearch";
esnodes     = "localhost:9200";
esindex     = "testsb";
estype      = "person";

//indir|
//read-dir|
file|
open-gzip|
//open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "personMorph.xml")|
split-entities|
change-id|
lookup-es(esName=esname, esNodex=esnodes, esIndex=esindex, esType=estype)|
encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="person", subdirSize=subdirsize, compress=compress, extension=extension);
