module CustomParser
  class LogFormatter
    def initialize(log_file)
      validation_checks(log_file)

      # convert the log file data into an array
      @log_data = File.readlines(log_file)
    end

    def fetch_most_page_views
      process(@log_data) { |d|
        puts '> list of webpages with most page views ordered from most page views to least page views:'
        prepare_response d, 'visits'
      }
    end

    def fetch_unique_page_views
      process(@log_data.uniq) { |d|
        puts '> list of webpages with most unique page views also ordered:'
        prepare_response d, 'unique views'
      }
    end

    private

    def validation_checks(log_file)
      # make sure the file exists
      raise 'Please, provide a log file!!!' unless File.exists?(log_file || '')
      # here we can also handle more validations like checking log file extension etc
    end

    # return data back to given block, so that we can use it for customizing response
    def process(filtered_data)
      yield get_sorted_counts(filtered_data) if block_given?
    end

    def get_sorted_counts(data)
      # throw out the IP address part
      d = data.map { |d| d.split.first }

      # tally method is introduced in ruby 2.7, so that's why the check
      # Because, it's better to use built-in methods than doing it yourself
      if RUBY_VERSION.to_f >= 2.7
        d.tally
      else
        d.group_by(&:itself).transform_values(&:count)
      end.sort_by { |_, v| -v } # sort in descending order
    end

    def prepare_response(data, text)
      data.each { |d| puts "#{d.first} #{d.last} #{text}" }
    end
  end
end
