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
  	@key = ''

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
  		# verify if valid HTTP URL
  		if host.start_with?('http')
  			@host = host

  			# add final slash (/) if not available
  			if !@host.end_with?('/')
  				@host += '/'
  			end
  		else
  			raise '[COEUS] Invalid host URL'
  		end
  	end

  	def self.get_host
  		@host
  	end

  	def self.print
  		puts "[COEUS] instance details\n\t- Host: #{@host}\n\t- API key: #{@key}"
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

  	def self.get_key
  		@key
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

	## 
  	# This method uses COEUS API to get write new triples based on provided parameters.
  	# *Note:* Requires that the API key is previously defined
  	#
  	# ==== Parameters
  	#
  	# * +sub+ - the new triple subject
  	# * +pred+ - the new triple predicate
  	# * +obj+ - the new riple object
  	# 
  	def self.write(sub, pred, obj)
  		if @key == ''
  			raise '[COEUS] undefined API key'
  		else
	  		content = URI.parse(@host + 'api/' + @key + '/write/' + sub + '/' + pred + '/' + obj).read
	  		result = JSON.parse(content)
	  		if result['status'] != 100
	  			raise '[COEUS] unable to store triple: ' + result['message']
	  		else
	  			return true
	  		end
	  	end
  	end

  	## 
  	# This method uses COEUS API to get update existing triples based on provided parameters.
  	# *Note:* Requires that the API key is previously defined
  	#
  	# ==== Parameters
  	#
  	# * +sub+ - the triple subject
  	# * +pred+ - the triple predicate
  	# * +old_obj+ - the old triple object
  	# * +new_obj+ - the new triple object
  	# 
  	def self.update(sub, pred, old_obj, new_obj)
  		if @key == ''
  			raise '[COEUS] undefined API key'
  		else
	  		content = URI.parse(@host + 'api/' + @key + '/update/' + sub + '/' + pred + '/' + old_obj + ',' + new_obj).read
	  		result = JSON.parse(content)
	  		if result['status'] != 100
	  			raise '[COEUS] unable to update triple: ' + result['message']
	  		else
	  			return true
	  		end
	  	end
  	end

	## 
  	# This method uses COEUS API to get delete triples based on provided parameters.
  	# *Note:* Requires that the API key is previously defined
  	#
  	# ==== Parameters
  	#
  	# * +sub+ - the triple subject to delete
  	# * +pred+ - the triple predicate to delete
  	# * +obj+ - the riple object to delete
  	# 
  	def self.delete(sub, pred, obj)
  		if @key == ''
  			raise '[COEUS] undefined API key'
  		else
	  		content = URI.parse(@host + 'api/' + @key + '/delete/' + sub + '/' + pred + '/' + obj).read
	  		result = JSON.parse(content)
	  		if result['status'] != 100
	  			raise '[COEUS] unable to delete triple: ' + result['message']
	  		else
	  			return true
	  		end
	  	end
  	end

  end
end
