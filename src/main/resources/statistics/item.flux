//default in = FLUX_DIR + "../item/correctMarcXML.xml";
default in = FLUX_DIR + "representativeData.xml";
default out = "stdout";

in|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "prov_stat_morph.xml")|
//stream-to-xml(roottag="rdf:RDF", recordtag="")| write(FLUX_DIR + "prov_stat_output.csv");
stream-to-triples|
count-triples(countBy="predicate")|
sort-triples(order="increasing")|
// for console use: write(out);
// for triples use: write(FLUX_DIR + "prov_stat_output.rdf");
// 
template("${s}\t${o}")| write(FLUX_DIR + "prov_stat_output.csv");
