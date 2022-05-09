#!/usr/bin/env ruby

require 'byebug'
require 'colorize'
require 'ipaddress'
require 'mimemagic'

Dir['./lib/**/*.rb'].sort.each { |file| require file }

LogFormatter.new(ARGV[0], ARGV[1]).format_and_exhibit
