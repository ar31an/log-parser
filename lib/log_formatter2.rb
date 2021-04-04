require_relative 'custom_parser'

# intentionally set this class name to match the module's class name, to explain the benefits of using modules
class LogFormatter
  extend CustomParser

  def initialize(arg = nil)
    @arg = arg
  end

  # class method
  class << self
    def run_script(arg = nil)
      log_formatter = LogFormatter.new(arg) # see info shared below
      log_formatter.fetch_most_page_views
      log_formatter.fetch_unique_page_views
    end
  end

  # instance method
  def run_script
    log_formatter = CustomParser::LogFormatter.new(@arg) # see info shared below
    log_formatter.fetch_most_page_views
    log_formatter.fetch_unique_page_views
  end
end

# The reason for defining 2 methods (one on class and other on instance level) is to explain what the extend keyword does
# It basically includes the CustomParser module in the class methods of LogFormatter class
# What that means is, if we access LogFormatter in those class methods it will be the LogFormatter class of CustomParser Module
# If you want to access the class method's LogFormatter class you have to call it like this: ::LogFormatter

# LogFormatter.new(ARGV.first).run_script
# This will execute the run_script instance method and to access the CustomParser module in this method you have to call it like: CustomParser::LogFormatter
