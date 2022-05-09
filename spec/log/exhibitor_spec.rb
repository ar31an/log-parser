# frozen_string_literal: true

require 'spec_helper'

describe Log::Exhibitor do
  context 'when stats are provided' do
    it 'displays appropriate information' do
      message = <<~MESSAGE
        #{'> list of pages with most views in ascending order:'.magenta}
        #{green_stars}
        #{"*#{space}Views#{space}|#{space}Page#{space}*".green}
        #{green_stars}
        #{"#{space(11)}10 Visits#{space(11)}/help_page/1".light_white}
        #{light_white_carets}

      MESSAGE

      expect do
        Log::Exhibitor.new(
          [['/help_page/1', 10]],
          tagline: '> list of pages with most views in ascending order:',
          message: 'Visits',
          uniq: false
        ).exhibit
      end.to output(message).to_stdout
    end
  end
end
