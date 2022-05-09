# frozen_string_literal: true

require 'colorize'

module ExhibitorSupport
  def green_stars(length = 52)
    ('*' * length).green
  end

  def light_white_carets(length = 52)
    ('^' * length).light_white
  end

  def space(length = 10)
    ' ' * length
  end
end

RSpec.configure do |config|
  config.include ExhibitorSupport
end
