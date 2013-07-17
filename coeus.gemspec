# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coeus/version'

Gem::Specification.new do |spec|
  spec.name          = "COEUS"
  spec.version       = COEUS::VERSION
  spec.authors       = ["Pedro Lopes"]
  spec.email         = ["hello@pedrolopes.net"]
  spec.description   = %q{COEUS: semantic web application framework}
  spec.summary       = %q{This. Is. Semantic.}
  spec.homepage      = "http://bioinformatics.ua.pt/coeus/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "rdf"
  spec.add_dependency "sparql"
  spec.add_dependency "json"
end
