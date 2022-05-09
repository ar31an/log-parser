# frozen_string_literal: true

require 'byebug'
require 'ipaddress'
require 'mimemagic'
require 'rspec'

Dir['./lib/**/*.rb'].sort.each { |file| require file }

# require helpers
Dir['./spec/support/**/*.rb'].sort.each { |file| require file }
