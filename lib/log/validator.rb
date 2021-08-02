module Log
  class Validator
    attr_reader :log_file

    def initialize(log_file)
      @log_file = log_file
    end

    def process
      valid_log_file
      # more validations can be handled here
    end

    private

    def valid_log_file
      raise 'Please, provide a log file!!!' unless File.exists?(log_file || '')
    end
  end
end
