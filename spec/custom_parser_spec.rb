require_relative '../custom_parser'

describe CustomParser::LogFormatter do
  context 'when file does not exist or file is not passed as an argument' do
    let(:message) { 'Please, provide a log file!!!' }

    it 'throws an error' do
      expect { described_class.new(nil) }.to raise_error(RuntimeError, message)
      expect { described_class.new('') }.to raise_error(RuntimeError, message)
      expect { described_class.new('non-existent-file.log') }.to raise_error(RuntimeError, message)
    end
  end

  context 'when file is passed as an argument and it exists' do
    let(:obj) { described_class.new('webserver.log') }
    let(:log_data) { obj.instance_variable_get(:@log_data) }
    let(:most_page_views) { [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]] }
    let(:unique_page_views) { [['/help_page/1', 23], ['/contact', 23], ['/home', 23], ['/index', 23], ['/about/2', 22], ['/about', 21]] }

    it 'displays appropriate information' do
      expect(obj.send(:get_sorted_counts, log_data)).to eq(most_page_views)
      expect(obj.send(:get_sorted_counts, log_data.uniq)).to eq(unique_page_views)
    end
  end
end
