require './lib/log/validator'
require './lib/log/sorted_counter'
require './lib/log/exhibitor'

class LogFormatter
  attr_reader :log_file, :log_data

  def initialize(log_file = nil)
    @log_file = log_file
  end

  def format_and_exhibit
    Log::Validator.new(log_file).process

    # convert the log file data into an array
    @log_data = File.readlines(log_file)

    # build stats by counting and sorting the logs
    all_views  = Log::SortedCounter.new(log_data).process
    uniq_views = Log::SortedCounter.new(log_data.uniq).process

    # display the stats on screen.
    # Another approach can be to skip the initializer and pass log_data directly to render method.
    # So, both calls can be made with one instance of Log::Exhibitor.
    Log::Exhibitor.new(
      all_views,
      '> list of webpages with most page views ordered from most page views to least page views:',
      'visits'
    ).render

    Log::Exhibitor.new(
      uniq_views,
      '> list of webpages with most unique page views also ordered:',
      'unique views'
    ).render
  end
end
