
default file = FLUX_DIR + "mapportal.formeta";
default out = FLUX_DIR +"out.foma";


//this libadmin API provides the institutions in Metafacture Formeta format
//Alternative (preferred in the future): use a decode-json command
//currently not provided by Metafacture core but written by HBZ - not tested until now. Has to be extended probably
//because in the decode-json command you can find a hint that it doesn't use path information (do they create deep structures??)


//default libadmin_as_formeta = "http://localhost/libadmin/api/formeta/green.formeta";
default libadmin_as_formeta = "http://admin.swissbib.ch/libadmintest/api/formeta/green.formeta";

//file|
//open-file|
libadmin_as_formeta |
open-http |
as-formeta-records|
decode-formeta|
// do something with morph to transform libadmin content into RDF
//once this is done serialize it (Searchengine, Sparql)
encode-formeta(style="MULTILINE")|
write("stdout");
