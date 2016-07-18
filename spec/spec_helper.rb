require 'bundler/setup'
require 'rubygems'
require 'rspec'
require 'json'
require_relative '../lib/locations_ng'

Bundler.setup

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.profile_examples = 3
  config.order = "random"

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
