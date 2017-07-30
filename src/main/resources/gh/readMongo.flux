default mongoDB = "monogdb://localhost:29017/nativeSources.sourceIDSBB";
default out = "stdout";
//default out = "/usr/local/swissbib/mfWorkflows/idsbb.xml    ";

//read-swissbib-mongo("mongodb://[set user]:[set password]@localhost:29017/nativeSources.sourceIDSBB") |


mongoDB |
//read-swissbib-mongo(user="[set user]", password="[set password]", host="localhost",
//    port="29017", database="nativeSources", collection="sourceSNL", matcher="SNL" ) |

read-swissbib-mongo(user="[set user]", password="[set password]", host="localhost",
    port="29017", database="nativeSources", collection="sourceIDSLU" ) |


read-string |
decode-xml |
handle-marcxml |
encode-formeta(style="CONCISE") |
write(out);

