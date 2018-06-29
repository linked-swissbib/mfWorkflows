

basedir = "/home/swissbib/environment/code/lod/python/out1";



basedir |
read-dir|
//file|
filter-strings(".*\\.gz", passmatches="true")|
open-gzip|

decode-xml|
handle-marcxml|
morph(FLUX_DIR + "extract_subfields.xml")|
stream-to-triples|
count-triples(countBy="predicate")|
sort-triples(order="increasing")|
// for console use: write(out);
// for triples use: write(FLUX_DIR + "np_output_subfields.rdf");
//template("${s}\t${o}")| write(FLUX_DIR + "np_output_subfields_gh.csv");
template("${s}\t${o}")| write("/home/swissbib/environment/code/lod/python/analyzed/analyze_subfields_swissbib_complete.csv");
