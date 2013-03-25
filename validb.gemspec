# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validb/version"

Gem::Specification.new do |s|
  s.name    = 'validb'
  s.version = Validb::VERSION
  s.platform = Gem::Platform::RUBY

  s.authors  = ['Joey Geiger']
  s.email    = 'jgeiger@gmail.com'
  s.homepage = 'http://github.com/jgeiger/validb'

  s.summary     = 'Validb checks for invalid data in your database.'
  s.description = 'Check the contents of your database by validating the models.'
  s.licenses    = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '>=3'
  s.add_dependency 'activesupport', '>=3'
end
