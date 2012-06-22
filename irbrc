#!/usr/bin/env ruby
alias q exit

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# Break out of the Bundler jail
# from https://github.com/ConradIrwin/pry-debundle/blob/master/lib/pry-debundle.rb
if defined? Bundler
  Gem.post_reset_hooks.reject! { |hook| hook.source_location.first =~ %r{/bundler/} }
  Gem::Specification.reset
  load 'rubygems/custom_require.rb'
end

# Now that we're out of "jali", we can require other gems
require 'rubygems'
require 'wirb'
require 'pp'
require 'awesome_print'
#require 'csv'
#require 'nokogiri'
#require 'spreadsheet'

Wirb.start

