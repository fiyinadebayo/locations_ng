# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'locations_ng/version'

Gem::Specification.new do |s|
  s.name          = 'locations_ng'
  s.version       = LocationsNg::VERSION
  s.authors       = ['Fiyin Adebayo']
  s.email         = 'fiyinsimeon@gmail.com'
  s.date          = '2016-07-17'
  s.summary       = 'States, Cities and LGAs in Nigeria.'
  s.description   = 'Provides methods to get all states, their cities and LGAs in Nigeria.'
  s.license       = 'MIT'
  s.homepage      = 'https://github.com/ceemion/locations_ng'
  s.required_ruby_version = '>= 2.3.1'

  s.files = Dir.glob('lib/**/*')

  s.add_dependency 'rails', '4.2.6'
  s.add_development_dependency 'spring'
end
