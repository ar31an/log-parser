#!/usr/bin/env ruby

require './log_formatter'

LogFormatter.new(ARGV.first).run_script
