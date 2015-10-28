indir       = "/home/seb/temp/marcDataMFSample";
outdir      = "/home/seb/temp/marcDataMFSample";
file        = "/home/seb/temp/marcDataMFSample/sample.xml.gz";
filesize    = "10000";
esnodes     = "localhost:9300";
escluster   = "elasticsearch";
records     = "5000";
index       = "testsb";
bulkheader      = "false";
jsoncompliant = "true";

indir|
read-dir|
//file|
open-gzip|
decode-xml|
handle-marcxml|
stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
    change-id|
    encode-esbulk-ng(escapeChars="true", header=bulkheader, index=index, type="bibliographicResource")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "documentMorph.xml")|
    change-id|
    encode-esbulk-ng(escapeChars="true", header=bulkheader, index=index, type="document")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "personMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk-ng(escapeChars="true", header=bulkheader, index=index, type="person")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "organisationMorph.xml")|
    split-entities|
    change-id|
    encode-esbulk-ng(escapeChars="true", header=bulkheader, index=index, type="organisation")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    filter(FLUX_DIR + "workFilter.xml")|
    morph(FLUX_DIR + "workMorph1.xml")|
    stream-to-triples(redirect="true")|
    sort-triples(by="all")|
    collect-triples|
    morph(FLUX_DIR + "workMorph2.xml")|
    encode-esbulk-ng(escapeChars="true", header=bulkheader, index=index, type="work")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
};

//TODO:
//morph(FLUX_DIR + "itemMorph.xml")|
