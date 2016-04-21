indir       = "/data/sbdump/marcDataMF_old";
outdir      = "/data/mfdumps/baseLineOutput";
//outdir      = "/data/mfdumps/test";
//file        = FLUX_DIR + "../resource/correctMarcXML.xml";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
//esnodes     = "sb-s9.swissbib.unibas.ch:9300#sb-s10.swissbib.unibas.ch:9300#sb-s11.swissbib.unibas.ch:9300";
esnodes     = "localhost:9300";
escluster   = "elasticsearch";
records     = "20000";
index       = "testsb_160422";
subdirsize  = "1000";
bulkheader  = "true";
jsoncompliant = "false";
compress    = "true";
extension   = "jsonld";

indir|
read-dir|
//file|
open-gzip|
//open-file|
decode-xml|
handle-marcxml|
change-id("001")|
itemerase-es(esNodes=esnodes, esClustername=escluster, esIndex=index, esType="item")|
//stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="bibliographicResource")|
    //write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="resource", subdirSize=subdirsize, compress=compress, extension=extension);
    index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records);
//}{
//    morph(FLUX_DIR + "documentMorph.xml")|
//    change-id|
//    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="document")|
//    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="document", subdirSize=subdirsize, compress=compress, extension=extension)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
//}{
//    morph(FLUX_DIR + "organisationMorph.xml")|
//    split-entities|
//    change-id|
//    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="organisation")|
//    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="organisation", subdirSize=subdirsize, compress=compress, extension=extension)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
//}{
//    filter(FLUX_DIR + "workFilter.xml")|
//    morph(FLUX_DIR + "workMorph1.xml")|
//    stream-to-triples(redirect="true")|
//    sort-triples(by="all")|
//    collect-triples|
//    morph(FLUX_DIR + "workMorph2.xml")|
//    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="work")|
//    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="work", subdirSize=subdirsize, compress=compress, extension=extension)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
//}{
//    morph(FLUX_DIR + "itemMorph.xml")|
//    split-entities|
//    change-id|
//    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="item")|
//    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="item", subdirSize=subdirsize, compress=compress, extension=extension)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
//};
