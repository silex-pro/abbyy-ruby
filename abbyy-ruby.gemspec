# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abbyy/version'

Gem::Specification.new do |spec|
  spec.name          = "abbyy-ruby"
  spec.version       = Abbyy::VERSION
  spec.authors       = ["Adrien Rambert"]
  spec.email         = ["contact@silex.pro"]
  spec.summary       = %q{A Ruby wrapper for the Abbyy Cloud OCR SDK API.}
  spec.homepage      = "https://github.com/silex-pro/abbyy-ruby"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "pry-doc", "~> 0"

  spec.add_dependency "rest-client", ">= 2.0.0"
end
