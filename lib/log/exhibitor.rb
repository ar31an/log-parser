# frozen_string_literal: true

require './lib/base_log'

module Log
  # Displays log stats!
  class Exhibitor < BaseLog
    def initialize(views, args = {})
      super()

      @views = views
      @args  = args
    end

    def exhibit
      exhibit_tagline
      exhibit_header
      exhibit_views
    end

    private

    attr_reader :views, :args

    def exhibit_tagline
      puts args[:tagline].magenta if args[:tagline]
    end

    def exhibit_header
      green_stars_bar { puts "*#{header_space}Views#{header_space}|#{header_space}Page#{header_space}*".green }
    end

    def exhibit_views
      views.each { |view| puts "#{view_space}#{view.last} #{args[:message] || ''}#{view_space}#{view.first}".light_white }
      puts ('^' * 52).light_white
      puts ''
    end

    def header_space
      ' ' * 10
    end

    def view_space
      ' ' * (args[:uniq] ? 8 : 11)
    end

    def green_stars_bar
      puts ('*' * 52).green
      yield if block_given?
      puts ('*' * 52).green
    end
  end
end
