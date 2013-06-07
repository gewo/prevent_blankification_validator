# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prevent_blankification_validator/version'

Gem::Specification.new do |s|
  s.name          = "prevent_blankification_validator"
  s.version       = PreventBlankificationValidator::VERSION
  s.authors       = ["Gebhard Wöstemeyer"]
  s.email         = ["g.woestemeyer@gmail.com"]
  s.description   = %q{Rails 3 Validator, that prevents attributes from being changed to a blank value once they're present.}
  s.summary       = %q{Rails 3 Validator, that prevents attributes from being changed to a blank value once they're present.}
  s.homepage      = "https://github.com/gewo/prevent_blankification_validator/"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ["lib"]


  s.add_runtime_dependency 'activemodel', ['~> 3.0']

  s.add_development_dependency 'activesupport', ['~> 3.0']
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end
