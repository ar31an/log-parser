#!/usr/bin/env ruby

require './lib/log_formatter'

LogFormatter.new(ARGV.first).format_and_exhibit
