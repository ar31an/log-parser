require_relative '../lib/log_formatter'

describe LogFormatter do
  context 'when file does not exist or file is not passed as an argument' do
    let(:message) { 'Please, provide a log file!!!' }

    it 'throws an error' do
      expect { described_class.new.format_and_exhibit }.to raise_error(RuntimeError, message)
      expect { described_class.new(nil).format_and_exhibit }.to raise_error(RuntimeError, message)
      expect { described_class.new('').format_and_exhibit }.to raise_error(RuntimeError, message)
      expect { described_class.new('non-existent-file.log').format_and_exhibit }.to raise_error(RuntimeError, message)
    end
  end

  context 'when file is passed as an argument and it exists' do
    it 'displays appropriate information' do
      message = <<~MESSAGE
        #{'*' * 100}
        > list of webpages with most page views ordered from most page views to least page views:
        /about/2 90 visits
        /contact 89 visits
        /index 82 visits
        /about 81 visits
        /help_page/1 80 visits
        /home 78 visits
        #{'*' * 100}
        #{'*' * 100}
        > list of webpages with most unique page views also ordered:
        /help_page/1 23 unique views
        /contact 23 unique views
        /home 23 unique views
        /index 23 unique views
        /about/2 22 unique views
        /about 21 unique views
        #{'*' * 100}
      MESSAGE
      expect { described_class.new('webserver.log').format_and_exhibit }.to output(message).to_stdout
    end
  end
end
