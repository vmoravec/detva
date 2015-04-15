# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'detva/version'

Gem::Specification.new do |spec|
  spec.name          = "detva"
  spec.version       = Detva::VERSION
  spec.authors       = ["Vladimir Moravec"]
  spec.email         = ["vmoravec@suse.com"]
  spec.summary       = %q{Bootstrap for api and js apps}
  spec.description   = %q{With sinatra, sprockets, bootstrap and backbone}
  spec.homepage      = "https://github.com/vmoravec/detva"
  spec.license       = "GNUGPL2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_dependency "sinatra", "~> 1.4"
  spec.add_dependency "sprockets", "~> 3.0"
  spec.add_dependency "tubesock", "~> 0.2"
end
