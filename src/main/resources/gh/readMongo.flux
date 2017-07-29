default mongoDB = "monogdb://localhost:29017/nativeSources.sourceIDSBB";
//default out = "stdout";
default out = "/usr/local/swissbib/mfWorkflows/idsbb.xml    ";


mongoDB |
read-swissbib-mongo("mongodb://localhost:29017/nativeSources.sourceIDSBB") |
read-string |
decode-xml |
handle-marcxml |
encode-formeta(style="CONCISE") |
write(out);

