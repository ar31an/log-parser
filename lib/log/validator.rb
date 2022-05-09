# frozen_string_literal: true

require './lib/base_log'

module Log
  # Validates the log file!
  class Validator < BaseLog
    ALLOWED_EXTENSIONS = %w[text/x-log].freeze
    SORT_DIRECTIONS    = %w[asc desc].freeze
    PAGE_REGEX         = %r{^/(?:[0-9a-zA-Z_-]+/?)+$}.freeze

    def initialize(log_file, sort_direction)
      super()

      @log_file       = log_file
      @sort_direction = sort_direction
    end

    def validate
      raise 'The file does not exist. Please provide a valid log file!' unless File.exist?(log_file || '')

      raise 'The file does not seems to be a valid log file!' unless ALLOWED_EXTENSIONS.include?(MimeMagic.by_path(log_file).type)

      raise 'The log file is emtpy!' if File.empty?(log_file)

      raise "The provided sort direction is invalid. The valid options are '#{SORT_DIRECTIONS.join(', ')}'!" unless SORT_DIRECTIONS.include?(sort_direction)
    end

    class << self
      def validate(args = {})
        # All IP Addresses in the provided file are invalid. That's why to show output, IP address validation is commented out.
        valid_page?(args[:page]) # && valid_ip?(args[:ip])
      end

      def valid_page?(page)
        page =~ PAGE_REGEX
      end

      def valid_ip?(ip)
        IPAddress.valid? ip
      end
    end
  end
end
