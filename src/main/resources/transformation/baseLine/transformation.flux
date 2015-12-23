indir       = "/data/sbdump/marcDataMF";
outdir      = "/data/sbdump/outputBulkJson";
file        = FLUX_DIR + "../resource/correctMarcXML.xml";
//file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
esnodes     = "sb-s2.swissbib.unibas.ch:9300#sb-s6.swissbib.unibas.ch:9300#sb-s7.swissbib.unibas.ch:9300";
escluster   = "linked-swissbib";
records     = "5000";
index       = "testsb_151223";
bulkheader      = "true";
jsoncompliant = "false";

indir|
read-dir|
//file|
open-gzip|
//open-file|
decode-xml|
handle-marcxml|
stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="bibliographicResource")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "documentMorph.xml")|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="document")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "personMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="person")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "organisationMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="organisation")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    filter(FLUX_DIR + "workFilter.xml")|
    morph(FLUX_DIR + "workMorph1.xml")|
    stream-to-triples(redirect="true")|
    sort-triples(by="all")|
    collect-triples|
    morph(FLUX_DIR + "workMorph2.xml")|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="work")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "itemMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="item")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
};
