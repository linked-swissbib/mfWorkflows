# Metafacture Workflows for linked-swissbib

This repository consists of

- a copy of the [distribution files](https://github.com/metafacture/metafacture-core/releases/tag/metafacture-core-5.0.0) of Metafacture 5.0
- Morph definitions for linked-swissbib workflows (see in `linked-swissbib/` folder)
- notes on usage (see below)


## Notes on usage

In order to use the Metafacture commands provided by linked-swissbib you have to obtain a build of
[swissbib-metafacture-commands](https://github.com/linked-swissbib/swissbib-metafacture-commands) and
move it to the `plugins/` folder (for instructions on how to build the artifact consult the respective [README]).

Furthermore there aren't any Flux files provided in this repository since in our use cases they need to
be created dynamically. However there exists a scripts which helps you set up a functional workflow. For
further information see [here](https://github.com/linked-swissbib/lsbPlatform/blob/master/README.md).


## Comprehensive list of Metafacture commands

Following a list of all Metafacture commands provided by [metafacture-core](https://github.com/metafacture/metafacture-core). For the linked-swissbib extensions consult the respective [README](https://github.com/linked-swissbib/swissbib-metafacture-commands/blob/master/README.md).

```bash
Command:                    Class:
-----------------------------------------------------------------------------------
add-oreaggregation          org.metafacture.linkeddata.OreAggregationAdder
add-preamble-epilogue       org.metafacture.formatting.PreambleEpilogueAdder
as-formeta-records          org.metafacture.formeta.FormetaRecordsReader
as-lines                    org.metafacture.io.LineReader
as-records                  org.metafacture.io.RecordReader
batch-log                   org.metafacture.monitoring.StreamBatchLogger
batch-reset                 org.metafacture.flowcontrol.StreamBatchResetter
calculate-metrics           org.metafacture.statistics.CooccurrenceMetricCalculator
catch-object-exception      org.metafacture.flowcontrol.ObjectExceptionCatcher
catch-stream-exception      org.metafacture.flowcontrol.StreamExceptionCatcher
change-id                   org.metafacture.mangling.RecordIdChanger
collect-triples             org.metafacture.triples.TripleCollect
count-triples               org.metafacture.triples.TripleCount
decode-aseq                 org.metafacture.biblio.AseqDecoder
decode-csv                  org.metafacture.csv.CsvDecoder
decode-formeta              org.metafacture.formeta.FormetaDecoder
decode-mab                  org.metafacture.biblio.MabDecoder
decode-marc21               org.metafacture.biblio.marc21.Marc21Decoder
decode-pica                 org.metafacture.biblio.pica.PicaDecoder
decode-string               org.metafacture.strings.StringDecoder
decode-xml                  org.metafacture.xml.XmlDecoder
decouple                    org.metafacture.flowcontrol.ObjectPipeDecoupler
defer-stream                org.metafacture.flowcontrol.StreamDeferrer
digest-file                 org.metafacture.files.FileDigestCalculator
discard-events              org.metafacture.mangling.StreamEventDiscarder
draw-uniform-sample         org.metafacture.statistics.UniformSampler
encode-formeta              org.metafacture.formeta.FormetaEncoder
encode-json                 org.metafacture.json.JsonEncoder
encode-literals             org.metafacture.formatting.StreamLiteralFormatter
encode-marc21               org.metafacture.biblio.marc21.Marc21Encoder
encode-pica                 org.metafacture.biblio.pica.PicaEncoder
filter                      org.metafacture.metamorph.Filter
filter-duplicate-objects    org.metafacture.mangling.DuplicateObjectFilter
filter-strings              org.metafacture.strings.StringFilter
filter-triples              org.metafacture.triples.TripleFilter
flatten                     org.metafacture.mangling.StreamFlattener
from-jdom-document          org.metafacture.jdom.JDomDocumentToStream
handle-cg-xml               org.metafacture.xml.CGXmlHandler
handle-comarcxml            org.metafacture.biblio.ComarcXmlHandler
handle-generic-xml          org.metafacture.xml.GenericXmlHandler
handle-mabxml               org.metafacture.biblio.AlephMabXmlHandler
handle-marcxml              org.metafacture.biblio.marc21.MarcXmlHandler
handle-picaxml              org.metafacture.biblio.pica.PicaXmlHandler
jscript                     org.metafacture.scripting.JScriptObjectPipe
json-to-elasticsearch-bulk  org.metafacture.elasticsearch.JsonToElasticsearchBulk
literal-to-object           org.metafacture.mangling.LiteralToObject
log-object                  org.metafacture.monitoring.ObjectLogger
log-stream                  org.metafacture.monitoring.StreamLogger
log-stream-time             org.metafacture.monitoring.StreamTimer
log-time                    org.metafacture.monitoring.ObjectTimer
map-to-stream               org.metafacture.javaintegration.MapToStream
match                       org.metafacture.strings.StringMatcher
merge-batch-stream          org.metafacture.plumbing.StreamBatchMerger
merge-same-ids              org.metafacture.plumbing.StreamMerger
morph                       org.metafacture.metamorph.Metamorph
normalize-unicode-stream    org.metafacture.strings.StreamUnicodeNormalizer
normalize-unicode-string    org.metafacture.strings.UnicodeNormalizer
object-batch-log            org.metafacture.monitoring.ObjectBatchLogger
object-tee                  org.metafacture.plumbing.ObjectTee
object-to-literal           org.metafacture.mangling.ObjectToLiteral
open-file                   org.metafacture.io.FileOpener
open-http                   org.metafacture.io.HttpOpener
open-resource               org.metafacture.io.ResourceOpener
open-tar                    org.metafacture.io.TarReader
pass-through                org.metafacture.plumbing.IdentityStreamPipe
print                       org.metafacture.io.ObjectStdoutWriter
rdf-macros                  org.metafacture.linkeddata.RdfMacroPipe
read-beacon                 org.metafacture.linkeddata.BeaconReader
read-dir                    org.metafacture.files.DirReader
read-string                 org.metafacture.strings.StringReader
read-triples                org.metafacture.triples.TripleReader
record-to-entity            org.metafacture.mangling.RecordToEntity
regex-decode                org.metafacture.strings.RegexDecoder
remodel-pica-multiscript    org.metafacture.biblio.pica.PicaMultiscriptRemodeler
reorder-triple              org.metafacture.triples.TripleReorder
retrieve-triple-objects     org.metafacture.triples.TripleObjectRetriever
sort-triples                org.metafacture.triples.TripleSort
split-lines                 org.metafacture.strings.LineSplitter
split-xml-elements          org.metafacture.xml.XmlElementSplitter
stream-count                org.metafacture.statistics.Counter
stream-tee                  org.metafacture.plumbing.StreamTee
stream-to-triples           org.metafacture.triples.StreamToTriples
stream-to-xml               org.metafacture.xml.SimpleXmlEncoder
string-list-map-to-stream   org.metafacture.javaintegration.StringListMapToStream
template                    org.metafacture.formatting.ObjectTemplate
to-jdom-document            org.metafacture.jdom.StreamToJDomDocument
triples-to-stream           org.metafacture.triples.TriplesToStream
wait-for-inputs             org.metafacture.flowcontrol.CloseSuppressor
write                       org.metafacture.io.ObjectWriter
write-files                 org.metafacture.io.ObjectFileWriter
write-triple-objects        org.metafacture.triples.TripleObjectWriter
write-triples               org.metafacture.triples.TripleWriter
write-xml-files             org.metafacture.xml.XmlFilenameWriter
xml-tee                     org.metafacture.plumbing.XmlTee
```


## List of Metamorph functions

Following a list of [Metamorph functions](https://github.com/metafacture/metafacture-core/wiki/Metamorph-functions) as of Metafacture 5.0.
For additional functions used by linked-swissbib see [here](https://github.com/linked-swissbib/swissbib-metafacture-commands/tree/master/src/main/java/org/swissbib/linked/mf/morph/functions).

```bash
Command:                    Class:
-------------------------------------------------------------------------------
regexp                      org.metafacture.metamorph.functions.Regexp
substring                   org.metafacture.metamorph.functions.Substring
compose                     org.metafacture.metamorph.functions.Compose
lookup                      org.metafacture.metamorph.functions.Lookup
whitelist                   org.metafacture.metamorph.functions.WhiteList
blacklist                   org.metafacture.metamorph.functions.BlackList
replace                     org.metafacture.metamorph.functions.Replace
isbn                        org.metafacture.metamorph.functions.ISBN
equals                      org.metafacture.metamorph.functions.Equals
not-equals                  org.metafacture.metamorph.functions.NotEquals
case                        org.metafacture.metamorph.functions.Case
htmlanchor                  org.metafacture.metamorph.functions.HtmlAnchor
trim                        org.metafacture.metamorph.functions.Trim
normalize-utf8              org.metafacture.metamorph.functions.NormalizeUTF8
urlencode                   org.metafacture.metamorph.functions.URLEncode
split                       org.metafacture.metamorph.functions.Split
occurrence                  org.metafacture.metamorph.functions.Occurrence
constant                    org.metafacture.metamorph.functions.Constant
count                       org.metafacture.metamorph.functions.Count
buffer                      org.metafacture.metamorph.functions.Buffer
switch-name-value           org.metafacture.metamorph.functions.SwitchNameValue
unique                      org.metafacture.metamorph.functions.Unique
script                      org.metafacture.metamorph.functions.Script
setreplace                  org.metafacture.metamorph.functions.SetReplace
timestamp                   org.metafacture.metamorph.functions.Timestamp
dateformat                  org.metafacture.metamorph.functions.DateFormat
```

## List of Metamorph collectors

Following a list of [Metamorph collectors](https://github.com/metafacture/metafacture-core/wiki/Metamorph-collectors) as of Metafacture 5.0

```bash
Command:                    Class:
-----------------------------------------------------------------------------
all                         org.metafacture.metamorph.collectors.All
any                         org.metafacture.metamorph.collectors.Any
combine                     org.metafacture.metamorph.collectors.Combine
choose                      org.metafacture.metamorph.collectors.Choose
group                       org.metafacture.metamorph.collectors.Group
concat                      org.metafacture.metamorph.collectors.Concat
none                        org.metafacture.metamorph.collectors.None
tuples                      org.metafacture.metamorph.collectors.Tuples
square                      org.metafacture.metamorph.collectors.Square
range                       org.metafacture.metamorph.collectors.Range
equalsFilter                org.metafacture.metamorph.collectors.EqualsFilter
```


## List of Metamorph maps

Following a list of different [Metamorph map types](https://github.com/metafacture/metafacture-core/wiki/Data-lookup) as of Metafacuture 5.0

```bash
Command:                    Class:
---------------------------------------------------------------------
filemap                     org.metafacture.metamorph.maps.FileMap
restmap                     org.metafacture.metamorph.maps.RestMap
sqlmap                      org.metafacture.metamorph.maps.SqlMap
jndisqlmap                  org.metafacture.metamorph.maps.JndiSqlMap
```


## List of ORE aggregations

Following a list of [Object Exchange and Reuse](https://www.openarchives.org/ore/) aggregations:

```bash
edm\:ProvidedCHO            edm:aggregatedCHO
edm\:WebResource            edm:isShownBy
```


## Example of Elasticsearch query after indexing

Following an example query after indexing with default linked-swissbib workflow

```bash
curl -XGET 'sb-ues1.swissbib.unibas.ch:8080/lsb/organisation/_search?pretty' -H 'Content-Type: application/json' -d'
{
  "query": {
    "term" : { "_id" : "http://data.swissbib.ch/organisation/NEBIS" }
  }
}
'



example indexing of libadmin
{"index":{"_type":"organisation","_index":"lsb","_id":"http://data.swissbib.ch/organisation/ABN-KURA"}}
{"@type":"http://xmlns.com/foaf/0.1/Organization","@context":"https://resources.swissbib.ch/organisation/context.jsonld","@id":"http://data.swissbib.ch/organisation/ABN-KURA","rdfs:label":["Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau"],"foaf:name":["Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau","Aargauer Kuratorium, Aarau"],"foaf:phone":"tel:+41628352310","vcard:hasAddress":{"vcard:street-address":"Bachstrasse 15","vcard:postal-code":"5001","vcard:locality":"Aarau","vcard:hasRegion":"http://sws.geonames.org/2661876/"}}
```
