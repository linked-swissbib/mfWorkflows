default file = FLUX_DIR + "correctMarcXML.xml";
//default file = FLUX_DIR + "../resource/representativeData.xml";

file|
open-file|
decode-xml|	
handle-marcxml|
filter(FLUX_DIR + "workFilter.xml")|
morph(FLUX_DIR + "workMorph.xml")|
stream-to-triples(redirect="true")|
sort-triples(by="all")|
collect-triples|
encode-formeta(style="multiline")|
//stream-to-xml(roottag="rdf:RDF", recordtag="subject", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "workOutput.formeta");

// dernier pas: transformer en RDF/XML
// as-formeta-records, decode-formeta, encode-formeta
// 