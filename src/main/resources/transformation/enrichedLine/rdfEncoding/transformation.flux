indir       = "/data/sbdump/marcDataMF";
outdir      = "/data/sbdump/rdfLineOutput";
file        = "/data/sbdump/marcDataMFSample.xml.gz";
filesize    = "10000";
roottag 	= "rdf:RDF";
recordtag   = "";
namespacefile = FLUX_DIR + "./maps/namespaces.txt";
index       = "testsb_160120";
subdirSize      = "1000";
compress    = "true";
extension   = "xml";

//indir|
//read-dir|
file|
open-gzip|
decode-xml|
handle-marcxml|
stream-tee| {
    morph(FLUX_DIR + "resourceMorph.xml")|
	stream-to-xml(roottag=roottag, recordtag=recordtag, namespacefile=namespacefile)|
	write-rdf-1line(baseOutDir=outdir, fileSize=filesize, subdirSize=subdirSize, type="resource", compress=compress, extension=extension)
}{
    morph(FLUX_DIR + "personMorph.xml")|
	stream-to-xml(roottag=roottag, recordtag=recordtag, namespacefile=namespacefile)|
	write-rdf-1line(baseOutDir=outdir, fileSize=filesize, subdirSize=subdirSize, type="person", compress=compress, extension=extension)
}{
    morph(FLUX_DIR + "organisationMorph.xml")|
	stream-to-xml(roottag=roottag, recordtag=recordtag, namespacefile=namespacefile)|
	write-rdf-1line(baseOutDir=outdir, fileSize=filesize, subdirSize=subdirSize, type="organisation", compress=compress, extension=extension)
}{
    filter(FLUX_DIR + "workFilter.xml")|
    morph(FLUX_DIR + "workMorph1.xml")|
    stream-to-triples(redirect="true")|
    sort-triples(by="all")|
    collect-triples|
    morph(FLUX_DIR + "workMorph2.xml")|
	stream-to-xml(roottag=roottag, recordtag=recordtag, namespacefile=namespacefile)|
	write-rdf-1line(baseOutDir=outdir, fileSize=filesize, subdirSize=subdirSize, type="work", compress=compress, extension=extension)
}{
    morph(FLUX_DIR + "itemMorph.xml")|
	stream-to-xml(roottag=roottag, recordtag=recordtag, namespacefile=namespacefile)|
	write-rdf-1line(baseOutDir=outdir, fileSize=filesize, subdirSize=subdirSize, type="item", compress=compress, extension=extension)
};
