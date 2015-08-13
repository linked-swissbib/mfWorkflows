basedir = "/home/sebastian/temp/marc21Current";
file = "/home/sebastian/temp/marc21Current/job1r115A001.format.xml.gz";

basedir|
read-dir|
//file|
open-gzip|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "resourceMorph.jsonld.xml")|
encode-esbulk|
//write-esbulk(baseOutDir="/home/sebastian/temp/linkedRDFOutput", fileSize="10000");
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="5000");
