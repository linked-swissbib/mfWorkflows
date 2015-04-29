default file = FLUX_DIR + "correctMarcXML.xml";

file|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "morph-item.xml")|
encode-formeta (style="multiline") |
write("stdout");

