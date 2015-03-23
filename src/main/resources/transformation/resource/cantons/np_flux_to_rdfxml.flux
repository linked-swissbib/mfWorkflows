default file = FLUX_DIR + "cantons_basis.xml";
//default file = FLUX_DIR + "inputData/job1r112A001.mf.xml";

file|
open-file|
decode-xml|
handle-generic-xml|
morph(FLUX_DIR + "np_morph_marc21.xml")|
stream-to-xml(roottag="rdf:RDF", recordtag="record", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "np_output_rdfxml.rdf");
//write-swissbib-searchengine;
