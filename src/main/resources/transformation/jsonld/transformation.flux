basedir = "/swissbib_index/linkedProcessing/marcDataCBS";
baseout = "/swissbib_index/linkedProcessing/linkedTestOutput";
nodes = "localhost:9300";
clusterName = "linked-swissbib-local";

basedir|
read-dir|
open-gzip|
decode-xml|
handle-marcxml|
stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
    encode-esbulk|
    //write-esbulk(baseOutDir=baseout, fileSize="10000")
    index-esbulk(esNodes=nodes, esClustername=clusterName, recordsPerUpload="5000")
}{
    morph(FLUX_DIR + "personMorph.xml")|
    encode-esbulk|
    //write-esbulk(baseOutDir=baseout, fileSize="10000")
    index-esbulk(esNodes=nodes, esClustername=clusterName, recordsPerUpload="5000")
}{
    filter(FLUX_DIR + "organisationFilter.xml")|
    morph(FLUX_DIR + "organisationMorph.xml")|    encode-esbulk|
    //write-esbulk(baseOutDir=baseout, fileSize="10000")
    index-esbulk(esNodes=nodes, esClustername=clusterName, recordsPerUpload="5000")
}{
    filter(FLUX_DIR + "workFilter.xml")|
    morph(FLUX_DIR + "workMorph1.xml")|
    stream-to-triples(redirect="true")|
    sort-triples(by="all")|
    collect-triples|
    morph(FLUX_DIR + "workMorph2.xml")|
    encode-esbulk|
    //write-esbulk(baseOutDir=baseout, fileSize="10000")
    index-esbulk(esNodes=nodes, esClustername=clusterName, recordsPerUpload="5000")
};

//TODO:
//morph(FLUX_DIR + "itemMorph.xml")|
