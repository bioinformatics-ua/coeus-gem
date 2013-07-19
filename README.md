# COEUS gem

A Ruby gem for accessing COEUS API

## Installation

Add this line to your application's Gemfile:

    gem 'coeus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coeus

## Usage

```ruby
# define COEUS base host address
COEUS::COEUS.host 'http://coeus.host'
``` 

```ruby
# define COEUS API key
COEUS::COEUS.key 'api key' 
``` 

```ruby
# execute SPARQL query on COEUS host
# returns RDF::Query::Solution array
COEUS::COEUS.query 'SELECT * {?s ?p ?o}'
```

```ruby
# get triples from COEUS knowledge base (http://bioinformatics.ua.pt/coeus/documentation/#rest)
# returns array with binded objects
COEUS::COEUS.triple 'subject', 'predicate', 'object'
```


```ruby
# write triples to COEUS knowledge base (http://bioinformatics.ua.pt/coeus/documentation/#rest)
# returns true if data written
COEUS::COEUS.write 'subject','predicate','object'
```

```ruby
# updates triple in COEUS knowledge base (http://bioinformatics.ua.pt/coeus/documentation/#rest)
# returns true if data updated
COEUS::COEUS.update 'subject','predicate','old object', 'new object'
```

```ruby
# delete triple from COEUS knowledge base (http://bioinformatics.ua.pt/coeus/documentation/#rest)
# returns true if data deleted
COEUS::COEUS.deleted 'subject','predicate','object'
```
