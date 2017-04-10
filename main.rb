require './trifork_generator'
require 'bundler/setup'
Bundler.require(:default)

trifork = TriforkGenerator.new

trifork.generate