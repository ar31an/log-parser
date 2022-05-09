# frozen_string_literal: true

require './lib/base_log'

# Handles the processing of log file and display of stats!
class LogFormatter < BaseLog
  def initialize(log_file, sort_direction)
    super()

    @log_file       = log_file
    @sort_direction = sort_direction || 'asc'
  end

  def format_and_exhibit
    Log::Validator.new(log_file, sort_direction).validate

    exhibit(
      Log::SortedCounter.new(log_file, uniq: false, sort_direction: sort_direction).count_and_sort,
      Log::SortedCounter.new(log_file, uniq: true,  sort_direction: sort_direction).count_and_sort
    )
  end

  private

  def exhibit(all_views, uniq_views)
    Log::Exhibitor.new(
      all_views,
      tagline: "> list of pages with most views in #{sort_direction_text} order:",
      message: 'Visits',
      uniq: false
    ).exhibit

    Log::Exhibitor.new(
      uniq_views,
      tagline: "> list of pages with most unique views in #{sort_direction_text} order:",
      message: 'Unique Views',
      uniq: true
    ).exhibit
  end
end
