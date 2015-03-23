default in = FLUX_DIR + "correctMarcXML.xml";
default out = "stdout";

in|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "extract_subfields.xml")|
stream-to-triples|
count-triples(countBy="predicate")|
sort-triples(order="increasing")|
// for console use: write(out);
// for triples use: write(FLUX_DIR + "np_output_subfields.rdf");
template("${s}\t${o}")| write(FLUX_DIR + "np_output_subfields.csv");
