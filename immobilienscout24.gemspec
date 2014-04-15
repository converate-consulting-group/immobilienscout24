# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "immobilienscout24"
  spec.version       = "0.1.0"
  spec.author        = ["Converate Consulting Group GmbH"]
  spec.email         = ["info@converate.com"]
  spec.description   = %q{Immobilienscout 24 API}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/converate-consulting-group/immobilienscout24"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "< 0.9.0"
  spec.add_runtime_dependency "faraday_middleware", ">= 0.9.0"
  spec.add_runtime_dependency "multi_xml", ">= 0"
  spec.add_runtime_dependency "hashie", ">= 0"
  spec.add_runtime_dependency "simple_oauth", ">= 0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
