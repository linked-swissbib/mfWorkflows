
default file = FLUX_DIR + "bibliotheken_ausschnitt.formeta.gh";
default out = FLUX_DIR +"out.foma";


//this libadmin API provides the institutions in Metafacture Formeta format
//Alternative (preferred in the future): use a decode-json command
//currently not provided by Metafacture core but written by HBZ - not tested until now. Has to be extended probably
//because in the decode-json command you can find a hint that it doesn't use path information (do they create deep structures??)


//default libadmin_as_formeta = "http://localhost/libadmin/api/formeta/green.formeta";
default libadmin_as_formeta = "https://admin.swissbib.ch/libadmintest/api/formeta/green.formeta";
//default libadmin_as_formeta = "http://localhost/libadmin/api/formeta/green.formeta";

file| open-file|
//libadmin_as_formeta| open-http|
as-formeta-records|
decode-formeta|
morph(FLUX_DIR + "libraryMorph.gh.xml")|
//once this is done serialize it (Searchengine, Sparql)
stream-to-xml(roottag="rdf:RDF", recordtag="", namespacefile= FLUX_DIR + "./maps/namespaces.txt")|
write(FLUX_DIR + "libraryOutput.gh.rdf");
