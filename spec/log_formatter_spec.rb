# frozen_string_literal: true

require 'spec_helper'

describe LogFormatter do
  context 'when file is passed as an argument and it exists' do
    it 'displays appropriate information in ascending order' do
      message = <<~MESSAGE
        #{'> list of pages with most views in ascending order:'.magenta}
        #{green_stars}
        #{"*#{space}Views#{space}|#{space}Page#{space}*".green}
        #{green_stars}
        #{"#{space(11)}78 Visits#{space(11)}/home".light_white}
        #{"#{space(11)}80 Visits#{space(11)}/help_page/1".light_white}
        #{"#{space(11)}81 Visits#{space(11)}/about".light_white}
        #{"#{space(11)}82 Visits#{space(11)}/index".light_white}
        #{"#{space(11)}89 Visits#{space(11)}/contact".light_white}
        #{"#{space(11)}90 Visits#{space(11)}/about/2".light_white}
        #{light_white_carets}

        #{'> list of pages with most unique views in ascending order:'.magenta}
        #{green_stars}
        #{"*#{space}Views#{space}|#{space}Page#{space}*".green}
        #{green_stars}
        #{"#{space(8)}21 Unique Views#{space(8)}/about".light_white}
        #{"#{space(8)}22 Unique Views#{space(8)}/about/2".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/help_page/1".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/contact".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/home".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/index".light_white}
        #{light_white_carets}

      MESSAGE
      expect { described_class.new('webserver.log', 'asc').format_and_exhibit }.to output(message).to_stdout
    end

    it 'displays appropriate information in descending order' do
      message = <<~MESSAGE
        #{'> list of pages with most views in descending order:'.magenta}
        #{green_stars}
        #{"*#{space}Views#{space}|#{space}Page#{space}*".green}
        #{green_stars}
        #{"#{space(11)}90 Visits#{space(11)}/about/2".light_white}
        #{"#{space(11)}89 Visits#{space(11)}/contact".light_white}
        #{"#{space(11)}82 Visits#{space(11)}/index".light_white}
        #{"#{space(11)}81 Visits#{space(11)}/about".light_white}
        #{"#{space(11)}80 Visits#{space(11)}/help_page/1".light_white}
        #{"#{space(11)}78 Visits#{space(11)}/home".light_white}
        #{light_white_carets}

        #{'> list of pages with most unique views in descending order:'.magenta}
        #{green_stars}
        #{"*#{space}Views#{space}|#{space}Page#{space}*".green}
        #{green_stars}
        #{"#{space(8)}23 Unique Views#{space(8)}/help_page/1".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/contact".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/home".light_white}
        #{"#{space(8)}23 Unique Views#{space(8)}/index".light_white}
        #{"#{space(8)}22 Unique Views#{space(8)}/about/2".light_white}
        #{"#{space(8)}21 Unique Views#{space(8)}/about".light_white}
        #{light_white_carets}

      MESSAGE
      expect { described_class.new('webserver.log', 'desc').format_and_exhibit }.to output(message).to_stdout
    end
  end
end
