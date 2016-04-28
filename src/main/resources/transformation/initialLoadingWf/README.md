# Base Line

The [base line workflow](./transformation.flux) transforms a MARC21 dataset into a special JSON-LD format which is compatible to the
specifications of the [Bulk API of Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html).

By default six different types for Elasticsearch are created:
* bibliographicResource
* document
* person
* organisation
* work
* item

Each of these types have one (or two) dedicated morph-file and probably also a filter file. Some of them depend on special
mappings. These can be found in the respective maps directory.
