default file = FLUX_DIR + "correctMarcXML.xml";
//default file = FLUX_DIR + "../resource/representativeData.xml";

file|
open-file|
decode-xml|	
handle-marcxml|
filter(FLUX_DIR + "workFilter.xml")|
morph(FLUX_DIR + "workMorph1.xml")|
stream-to-triples(redirect="true")|
sort-triples(by="all")|
collect-triples|
morph(FLUX_DIR + "workMorph2.xml")|
stream-to-xml(roottag="rdf:RDF", recordtag="", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "workOutput.rdf");

//encode-formeta(style="multiline")| write(FLUX_DIR + "workOutput.formeta");
//stream-to-xml(roottag="rdf:RDF", recordtag="subject", namespacefile= FLUX_DIR + "./maps/namespaces.txt")| write(FLUX_DIR + "workOutputXXX.formeta");