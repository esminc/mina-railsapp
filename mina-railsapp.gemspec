# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/railsapp/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-railsapp"
  spec.version       = Mina::Railsapp::VERSION
  spec.authors       = ["dot"]
  spec.email         = ["shuhei.kondo@gmail.com"]
#  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{mina recipes for deploying railsapp}
  spec.homepage      = "https://github.com/esminc/mina-railsapp"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
