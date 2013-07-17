require "coeus/version"
require "open-uri"
require "json"
require "rdf"
require "sparql"

module COEUS
  class COEUS
  	@host = 'http://bioinformatics.ua.pt/coeus/'
  	@key = 'uavr'

  	def self.host(host)
  		if host.start_with?('http')
  			@host = host
  		else
  			puts 'Invalid host'
  		end
  	end

  	def self.open
  		puts @host
  	end

  	def self.key(key)
  		@key = key
  	end

  	def self.triple(sub, pred, obj)
  		content = URI.parse(@host + 'api/triple/' + sub + '/' + pred + '/' + obj + '/js').read
  		return JSON.parse(content)['results']['bindings']
  	end

  	def self.query(query)
  		sparql = SPARQL::Client.new(@host + 'sparql')
  		#queryable = RDF::Repository.load(@host + 'sparql')
  		#solutions = SPARQL.execute(query, sparql)
  		#return solutions.to_json
  		return sparql.query(query)
  	end
  end
end
