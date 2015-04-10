# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shipit2/version'

Gem::Specification.new do |spec|
  spec.name          = "shipit2"
  spec.version       = ShipIt2::VERSION
  spec.authors       = ["Josh Shaloo", "Robert Hunter"]
  spec.email         = ["shaloo@email.arizona.edu"]
  spec.summary       = %q{CLI tools for managing UAR Jira project.}
  spec.description   = %q{CLI tools for managing the UA Research Jira project.}
  spec.homepage      = "http://www.arizona.edu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "cucumber", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_runtime_dependency "jira-ruby", "~> 0.1"
  spec.add_runtime_dependency "open4", "~> 1.3"
  spec.add_runtime_dependency "thor", "~> 0.19"
end
