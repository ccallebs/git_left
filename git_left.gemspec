# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_left/version'

Gem::Specification.new do |spec|
  spec.name          = "git_left"
  spec.version       = GitLeft::VERSION
  spec.authors       = ["Chuck Callebs"]
  spec.email         = ["chuck@callebs.io"]

  spec.summary       = %q{Swipe left for `git branch` zero.}
  spec.description   = %q{Swipe left for `git branch` zero.}
  spec.homepage      = "http://github.com/ccallebs/git_left"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["git_left"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "git",  "~> 1.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
