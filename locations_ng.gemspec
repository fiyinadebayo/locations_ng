# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'locations_ng/version'
require 'date'

Gem::Specification.new do |s|
  s.name          = 'locations_ng'
  s.version       = LocationsNg::VERSION
  s.authors       = ['Fiyin Adebayo']
  s.email         = 'fiyinsimeon@gmail.com'
  s.date          = Date.today.strftime('%Y-%m-%d')
  s.summary       = 'States, Cities and LGAs in Nigeria.'
  s.description   = 'Provides methods to get all states, their cities and LGAs in Nigeria.'
  s.license       = 'MIT'
  s.homepage      = 'https://github.com/ceemion/locations_ng'
  s.required_ruby_version = '>= 2.3.1'

  s.files = Dir.glob('lib/**/*')
  s.test_files = Dir.glob('{test,spec,features}/**/*')

  s.add_dependency 'rails', '5.1.3'
  s.add_development_dependency 'rspec', '~> 3.5'
end
