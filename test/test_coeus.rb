require 'test/unit'
require "open-uri"
require 'coeus'

class Test_COEUS < Test::Unit::TestCase
	def test_host
		COEUS::COEUS.host('http://bioinformatics.ua.pt/diseasecard')
		assert_equal 'http://bioinformatics.ua.pt/diseasecard/', COEUS::COEUS.get_host
	end

	def test_key
		COEUS::COEUS.key('12345')
		assert_equal '12345', COEUS::COEUS.get_key
	end

	def test_sparql
		@query = "PREFIX coeus: <http://bioinformatics.ua.pt/coeus/resource/>\nSELECT COUNT(DISTINCT ?tag) { ?tag coeus:hasConcept coeus:concept_UniProt}"
		assert_equal COEUS::COEUS.query(@query).size, 1
	end

	def test_triple
		@result = COEUS::COEUS.triple 'coeus:concept_UniProt', 'dc:title', 'obj'
		assert_instance_of Array, @result
	end

	def test_write
		COEUS::COEUS.key 'uavr'
		@result = COEUS::COEUS.write 'coeus:gemx','dc:title','gemx'
		assert @result
	end

	def test_update
		COEUS::COEUS.key 'uavr'
		@result = COEUS::COEUS.update 'coeus:gemx','dc:title','gemx','gemy'
		assert @result
	end

	def test_delete
		COEUS::COEUS.key 'uavr'
		@result = COEUS::COEUS.delete 'coeus:gemx','dc:title','gemy'
		assert @result
	end

	def test_all
		# set API key
		COEUS::COEUS.key 'uavr'

		# write new triple
		assert COEUS::COEUS.write('coeus:gem_x','dc:title','gem_x')

		# check added triple output
		@res = COEUS::COEUS.triple 'coeus:gem_x', 'dc:title', 'obj'
		assert_equal @result[0]["obj"]["value"], "gem_x"

		# update triple content
		assert COEUS::COEUS.update('coeus:gem_x','dc:title','gem_x', 'coeus-gem')

		# check updated triple content
		@res = COEUS::COEUS.triple 'coeus:gem_x', 'dc:title', 'obj'
		assert_equal @result[0]["obj"]["value"], "coeus-gem"

		# delete triple
		assert COEUS::COEUS.delete('coeus:gem_x','dc:title','coeus-gem')
	end
end