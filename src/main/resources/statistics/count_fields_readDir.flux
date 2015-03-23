//default in = FLUX_DIR + "correctMarcXML.xml";
//default in = FLUX_DIR + "/inputData/job1r112A001.mf.xml";
//default out = "stdout";

//default file = FLUX_DIR + "inputData/job1r114A042.format.mf.xml";
basedir = "/home/swissbib/environment/code/lod/python/out2";



basedir |
read-dir|
//file|
filter-strings(".*\\.xml", passmatches="true")|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "extract_fields.xml")|
stream-to-triples|
count-triples(countBy="predicate")|
sort-triples(order="increasing")|
// for console use: write(out);
// for triples use: write(FLUX_DIR + "np_output_fields.rdf");
template("${s}\t${o}")| write("/home/swissbib/environment/code/lod/python/analyzed/np_output_fields.part2.csv");
