#!/usr/bin/env ruby

require './lib/log_formatter'

LogFormatter.new(ARGV.first).run_script
