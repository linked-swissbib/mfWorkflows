
basedir = "/home/sebastian/temp/marc21Current";   // <= Put here the path (if needed)
file = "";      // <= Put here the path (if needed)

basedir|
read-dir|
//file|
open-gzip|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "resourceMorph.jsonld.xml")|
encode-esbulk|
write-esbulk(baseOutDir="/home/sebastian/temp/linkedRDFOutput", fileSize="10000");    // <= Fill in a value for baseOutDir (if needed)
//index-esbulk(esNodes="", esClustername="elasticsearch", recordsPerUpload="5000"); // <= A value for esNodes
