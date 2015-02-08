# encoding: utf-8
require File.expand_path("../lib/scruby/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'scruby'
  s.version     = Scruby::VERSION.dup
  s.summary     = ""
  s.description = ""
  s.author      = "Endika Gutiérrez"
  s.email       = "me@endika.net"
  s.files       = Dir["MIT-LICENSE", "README.md", "lib/**/*"]
  s.homepage    = 'https://github.com/endSly/scruby'
  s.license     = 'MIT'

  s.add_dependency 'nokogiri', '>= 1.6', '< 1.7'
end
