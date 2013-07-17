require "coeus/version"
require "open-uri"
require "json"
require "rdf"
require "sparql"

##
# = COEUS
#
# Main COEUS gem module
module COEUS
  class COEUS
  	# COEUS base host URL
  	@host = 'http://bioinformatics.ua.pt/coeus/'

  	# COEUS API key
  	@key = 'uavr'

  	## 
  	# This method defines the base COEUS host for the next actions
  	#
  	# ==== Parameters
  	#
  	# * +host+ - the new host settings
  	#
  	# ==== Default
  	# * http://bioinformatics.ua.pt/coeus/
  	# 
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

  	## 
  	# This method defines the COEUS seed API key
  	#
  	# ==== Parameters
  	#
  	# * +key+ - the COEUS API key
  	#
  	# ==== Default
  	# * uavr
  	# 
  	def self.key(key)
  		@key = key
  	end

  	## 
  	# This method uses COEUS API to get match triples based on provided parameters
  	#
  	# ==== Parameters
  	#
  	# * +sub+ - the triple set subject
  	# * +pred+ - the triple set predicate
  	# * +obj+ - the triple set object
  	#
  	# ==== Default
  	# * http://bioinformatics.ua.pt/coeus/
  	# 
  	def self.triple(sub, pred, obj)
  		content = URI.parse(@host + 'api/triple/' + sub + '/' + pred + '/' + obj + '/js').read
  		return JSON.parse(content)['results']['bindings']
  	end


  	## 
  	# This method performs a SPARQL query on the COEUS endpoint
  	#
  	# ==== Parameters
  	#
  	# * +query+ - the complete SPARQL query (including prefixes)
  	# 
  	def self.query(query)
  		sparql = SPARQL::Client.new(@host + 'sparql')
  		return sparql.query(query)
  	end
  end
end
