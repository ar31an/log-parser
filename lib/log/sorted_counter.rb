# frozen_string_literal: true

require './lib/base_log'

module Log
  # Processes log file and builds stats!
  class SortedCounter < BaseLog
    def initialize(log_file, args = {})
      super()

      @log_file = log_file
      @args     = args

      @entries = {}
    end

    def count_and_sort
      read_lines

      # if all records are needed then count all.
      # if unique records are needed then count only unique records.
      # apply the ascending/descending order.
      entries.transform_values { |v| args[:uniq] ? v.uniq.count : v.count }
             .sort_by { |_, v| args[:sort_direction] == 'asc' ? v : -v }
    end

    private

    attr_reader :args, :entries

    def read_lines
      File.open(log_file) do |file|
        file.each_line do |line|
          page, ip = line.split

          next unless Log::Validator.validate(page: page, ip: ip)

          @entries[page] ||= []
          @entries[page] << ip
        end
      end
    end
  end
end
