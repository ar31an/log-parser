require_relative '../log_formatter2'

describe LogFormatter do
  context 'when file does not exist or file is not passed as an argument' do
    let(:message) { 'Please, provide a log file!!!' }

    it 'throws an error' do
      expect { described_class.run_script }.to raise_error(RuntimeError, message)
      expect { described_class.run_script(nil) }.to raise_error(RuntimeError, message)
      expect { described_class.run_script('') }.to raise_error(RuntimeError, message)
      expect { described_class.run_script('non-existent-file.log') }.to raise_error(RuntimeError, message)
    end
  end

  context 'when file is passed as an argument and it exists' do
    it 'displays appropriate information' do
      message = <<~MESSAGE
        > list of webpages with most page views ordered from most page views to least page views:
        /about/2 90 visits
        /contact 89 visits
        /index 82 visits
        /about 81 visits
        /help_page/1 80 visits
        /home 78 visits
        > list of webpages with most unique page views also ordered:
        /help_page/1 23 unique views
        /contact 23 unique views
        /home 23 unique views
        /index 23 unique views
        /about/2 22 unique views
        /about 21 unique views
      MESSAGE
      expect { described_class.run_script('webserver.log') }.to output(message).to_stdout
    end
  end
end
