# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-lockfile/version.rb'

Gem::Specification.new do |spec|
  spec.name          = CocoapodsLockfile::NAME
  spec.version       = CocoapodsLockfile::VERSION
  spec.authors       = ['Israel Soto']
  spec.email         = ['israel.spgh@gmail.com']
  spec.summary       = %q{A Cocoapods plugin that generates the Podfile.lock file without the need to download the Pods files.}
  spec.homepage      = 'https://github.com/SotoiGhost/cocoapods-lockfile'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = ">= 2.0"

  spec.add_runtime_dependency 'cocoapods', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 13.0'
end
