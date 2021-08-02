module Log
  class SortedCounter
    attr_reader :log_data

    def initialize(log_data)
      @log_data = log_data
    end

    def process
      # tally method is introduced in ruby 2.7, so that's why the check
      if RUBY_VERSION.to_f >= 2.7
        filter_log.tally
      else
        filter_log.group_by(&:itself).transform_values(&:count)
      end.sort_by { |_, v| -v }
    end

    private

    def filter_log
      # throw out the IP address part
      log_data.map { |d| d.split.first }
    end
  end
end
