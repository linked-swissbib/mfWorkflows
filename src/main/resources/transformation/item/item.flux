default file = FLUX_DIR + "correctMarcXML.xml";

file|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "itemMorph.xml")|
encode-formeta (style="multiline") |
//write("stdout");
write(FLUX_DIR + "itemOutput.rdf");

