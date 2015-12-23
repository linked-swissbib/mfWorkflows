# Enriched (Alternative) Line

The enriched line workflow consists of two parts:

1. A [transformation step](./ntriplesEncoding/transformation.flux) from MARC21 to N-Triples, a RDf serialization.

2. A [transformation step](./ntriplesDecoding/transformation.flux) from N-Triples into a special JSON-LD format which is compatible to the specifications of the [Bulk API of Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html). This step results in a single Elasticsearch type. An other FLUX file ([decode-ntriples.flux](./ntriplesDecoding/obolete/transformation.flux)) is provided but it does only work with a VIAF enrichment and is thus obsolete.

This workflow allows to enrich datasets with data e.g. from VIAF or DBPedia using dedicated tools (e.g. [LIMES](http://aksw.org/Projects/LIMES.html)) in an intermediary step. The first part of the workflow expects a MARC21 dataset as input, the second part an enriched N-Triples file.
