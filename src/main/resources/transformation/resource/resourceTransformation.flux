default file = FLUX_DIR + "correctMarcXML.xml";
//default file = "/swissbib_index/linkedInput/representativeData.xml";

file|
open-file|
decode-xml|	
handle-marcxml|
morph(FLUX_DIR + "morph-marc21ToRdf-XML.xml")|
stream-to-xml(roottag="rdf:RDF", recordtag="", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "outputResource.rdf");
//we can use this mechanism to produce files where each RDF Document is written to one line
//this is very handy for the next python step (and for Gesis Sparql processes)
//at the moment we use Python for the JSON-LD ES transformation
//next stept is to use a MF module for the JSON-LD transformation to ES - not at the moment
//write-rdf-1line(baseOutDir="/swissbib_index/linkedRDFOutput");
