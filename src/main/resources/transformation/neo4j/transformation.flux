indir       = "/home/seb/tmp/marcDataMF";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
dbdir       = "/home/seb/tmp/neo4j/neo4j-data";
batchsize   = "20000";

//file|
indir|
read-dir|
open-gzip|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "morph.xml")|
change-id|
index-neo4j(dbDir=dbdir, batchSize=batchsize);
