# encoding: utf-8

require 'rspec'
require 'httparty'

Dir.glob(File.expand_path('spec/support/**/*.rb')).each do |f|
  require f
end

RSpec.configure do |config|
  config.include FixtureHelpers
end
