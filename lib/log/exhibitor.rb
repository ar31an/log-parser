module Log
  class Exhibitor
    attr_reader :log_data, :tagline, :message

    def initialize(log_data, tagline, message)
      @log_data = log_data
      @tagline  = tagline
      @message  = message
    end

    def render
      puts '*' * 100
      puts tagline
      log_data.each { |data| puts "#{data.first} #{data.last} #{message}" }
      puts '*' * 100
    end
  end
end
