indir       = "/data/sbdump/marcDataMF";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
dbdir       = "/data/neo4j-test";
batchsize   = "20000";

outdir      = "/data/mfdumps/test";
//file        = FLUX_DIR + "../resource/correctMarcXML.xml";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
records     = "20000";
index       = "testsb_160424";
subdirsize  = "1000";
bulkheader  = "true";
jsoncompliant = "false";
compress    = "true";
extension   = "jsonld";

//file|
indir|
read-dir|
open-gzip|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "morph.xml")|
change-id|
// For working with Neo4j as embedded DB
index-neo4j(dbDir=dbdir, batchSize=batchsize)|
// For working with Neo4j over the Bolt driver
//index-neo4j(batchSize="10000", dbUser="neo4j", dbPwd="neo4j_15")|
encode-esbulk(escapeChars="true", header=bulkheader, index=index, type="bibliographicResource")|
write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant, type="resource", subdirSize=subdirsize, compress=compress, extension=extension);
