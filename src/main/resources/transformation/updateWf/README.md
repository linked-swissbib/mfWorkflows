# Update Workflow

The [update workflow](./transformation.flux) transforms a MARC21 dataset into five concepts and index them either directly
 in Elasticsearch or sends them to a special enrichment workflow in order to update the data with information from DBPedia
 and Viaf. It is called update workflow because it does not process the entire dataset of Swissbib but a small subset
 which has been updated by CBS lately.

By default six different types for Elasticsearch are created:
* bibliographicResource
* document
* person (enriched)
* organisation
* item

Each of these types have one (or two) dedicated morph-file. Some of them depend on special
mappings. These can be found in the respective maps directory.
