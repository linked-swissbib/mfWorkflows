default file = FLUX_DIR + "correctMarcXML.xml";
//default file = "/swissbib_index/linkedInput/representativeData.xml";

file|
open-file|
decode-xml|	
handle-marcxml|
morph(FLUX_DIR + "organisationMorph.xml")|
stream-to-xml(roottag="rdf:RDF", recordtag="", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "organisationOutput.rdf");