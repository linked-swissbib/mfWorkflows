// default file = "/home/sebastian/temp/job1r112A001.mf.xml";
default file = FLUX_DIR + "correctMarcXML.xml";
basedir = "/home/sebastian/workspace/mfWorkflows/src/main/resources/transformation/resource";

file|
open-file|
decode-xml|
handle-marcxml|
morph(FLUX_DIR + "morph-marc21ToJsonLd.xml")|
write-esbulk|
// encode-json|
write-jsonld(baseOutDir="/home/sebastian/temp/outputResource",fileSize="10000", contextFile="/home/sebastian/workspace/utilities/examples/04/context.jsonld");
