indir       = "/data/sbdump/marcDataMF";
outdir      = "/data/sbdump/marcDataMFSample";
//file        = "/home/seb/temp/marcDataMFSample/sample.xml.gz";
filesize    = "10000";
esnodes     = "localhost:9300";
escluster   = "elasticsearch";
records     = "5000";
index       = "testsb_151118";
bulkheader      = "true";
jsoncompliant = "false";

indir|
read-dir|
open-gzip|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "personMorph.xml")|
split-entities|
change-id|
stream-to-triples(redirect="true")|
sort-triples(by="all")|
filter-duplicate-objects|
collect-triples|
encode-ntriples|
write-esbulk(baseOutDir=outdir, fileSize=filesize, jsonCompliant=jsoncompliant);
//index-esbulk(esNodes=esnodes, esClustername=escluster, recordsPerUpload=records);
