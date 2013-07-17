require 'coeus'

class LOL
#@result = COEUS::COEUS.triple 'coeus:uniprot_P78312', 'coeus:isAssociatedTo', 'obj'

 #@result['results']['bindings'].each do |item|
 #	puts item['obj']['value']
 #end
 @query = "PREFIX coeus: <http://bioinformatics.ua.pt/coeus/resource/>\nPREFIX dc: <http://purl.org/dc/elements/1.1/>\nSELECT * { ?uniprot coeus:hasConcept coeus:concept_UniProt . ?uniprot dc:identifier ?id . ?uniprot dc:title ?name }"


 COEUS::COEUS.query(@query).each do |item|
 	puts item[:id]
 end
end