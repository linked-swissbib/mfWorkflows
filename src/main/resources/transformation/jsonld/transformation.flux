indir       = "/home/seb/temp/tempSample";
outdir      = "/home/seb/temp/tempSample";
filesize    = "10000";
esnodes     = "localhost:9300";
escluster   = "elasticsearch";
records     = "5000";
index       = "testsb";


indir|
read-dir|
open-gzip|
decode-xml|
handle-marcxml|
stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
    change-id|
    encode-esbulk-ng2(header="true", index=index, type="bibliographicResource", idKeyName="@id")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "documentMorph.xml")|
    change-id|
    encode-esbulk-ng2(header="true", index=index, type="document", idKeyName="@id")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "personMorph.xml")|
    change-id|
    encode-esbulk-ng2(multipleObjects="true", header="true", index=index, type="person", idKeyName="@id")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    morph(FLUX_DIR + "organisationMorph.xml")|
    change-id|
    encode-esbulk-ng2(multipleObjects="true", header="true", index=index, type="organisation", idKeyName="@id")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
}{
    filter(FLUX_DIR + "workFilter.xml")|
    morph(FLUX_DIR + "workMorph1.xml")|
    stream-to-triples(redirect="true")|
    sort-triples(by="all")|
    collect-triples|
    morph(FLUX_DIR + "workMorph2.xml")|
    encode-esbulk-ng2(multipleObjects="true", header="true", index=index, type="work")|
    write-esbulk(baseOutDir=outdir, fileSize=filesize)
    //index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records)
};

//TODO:
//morph(FLUX_DIR + "itemMorph.xml")|
