default file = FLUX_DIR + "correctMarcXML.xml";
//default file = FLUX_DIR + "inputData/job1r112A001.mf.xml";

file|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "morph_marc21ToRdf.xml")|
stream-to-xml(roottag="rdf:RDF", recordtag="", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "outputResource.rdf");
//write-swissbib-searchengine;
