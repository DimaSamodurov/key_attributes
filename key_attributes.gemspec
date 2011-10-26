# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "key_attributes/version"

Gem::Specification.new do |s|
  s.name        = "key_attributes"
  s.version     = KeyAttributes::VERSION
  s.authors     = ["Dima Samodurov"]
  s.email       = ["dmitriy.samodurov@sap.com"]
  s.homepage    = ""
  s.summary     = %q{Key attributes - a MongoMapper plugin.}
  s.description = %q{Plugin allows to extract single level attributes of a model, skipping associations.}

  s.rubyforge_project = "key_attributes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency(%q<mongo_mapper>, [">= 0.9.2"])
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
