// default file = "/home/sebastian/temp/job1r112A001.mf.xml";
default file = "/home/sebastian/temp/marc_mfcompatible/job1r115A001.format.xml.gz";
// basedir = "/home/sebastian/workspace/mfWorkflows/src/main/resources/transformation/resource";

file|
open-gzip|
// open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "resourceMorph.xml")|
encode-esbulk|
// write-esbulk(baseOutDir="<Your path here>", fileSize="10000");
index-esbulk(esNode="localhost", esPort="9300", esClustername="linked-swissbib", recordsPerUpload="10000");
