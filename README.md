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
COEUS::COEUS.host(new_host)
``` 

```ruby
# get triples from COEUS knowledge base (http://bioinformatics.ua.pt/coeus/documentation/#rest)
# returns JSON array with binded objects
COEUS::COEUS.triple(subject, predicate, object)
```

```ruby
# execute SPARQL query on COEUS host
# returns RDF::Query::Solution array
COEUS::COEUS.query(query)
```
