# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grbio/version'

Gem::Specification.new do |spec|
  spec.name          = "grbio"
  spec.version       = Grbio::VERSION
  spec.authors       = ["Matt Yoder"]
  spec.email         = ["diapriid@gmail.com"]

  spec.summary       = %q{A utility wrapper around http://grbio.org data.'}
  spec.description   = %q{Tools for downloading and examining data/metadata from http://grbio.org.  Includes }
  spec.homepage      = "http://github.com/speciesfile_group/grbio"
  spec.license       = "https://opensource.org/licenses/NCSA"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 1.0.2"
  spec.add_dependency "tilt"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "byebug"

  spec.add_development_dependency 'webmock', '~> 1.24.1'
  spec.add_development_dependency "vcr", "~> 3.0.1"
end
