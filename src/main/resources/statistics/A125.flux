basedir = "/swissbib_index/marcDataCBS/MFcompatibleFormat.all"
//default file = FLUX_DIR + "job1r115A001.format.xml";
//default file = FLUX_DIR + "representativeData.xml";
//default file = FLUX_DIR + "inputData/job1r112A001.mf.xml";
//default out = "stdout";

basedir |
read-dir|
//file|
open-file|
decode-xml|
handle-marcxml|
filter(FLUX_DIR + "A125_filter.xml")|
morph(FLUX_DIR + "A125_morph.xml")|
stream-to-triples|
template("${p}\t${o}")|
//write(out);
write(FLUX_DIR + "A125_output.csv");
