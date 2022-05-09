# frozen_string_literal: true

# Base class for the log namespace!
class BaseLog
  attr_reader :log_file, :sort_direction

  def sort_direction_text
    sort_direction == 'asc' ? 'ascending' : 'descending'
  end
end
