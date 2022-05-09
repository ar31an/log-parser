# frozen_string_literal: true

require 'spec_helper'

describe Log::Validator do
  context 'when the file does not exist, has an invalid type, or is emtpy!' do
    let(:missing_file_message)      { 'The file does not exist. Please provide a valid log file!' }
    let(:invalid_file_type_message) { 'The file does not seems to be a valid log file!' }
    let(:empty_file_message)        { 'The log file is emtpy!' }

    it 'throws an error' do
      expect { described_class.new('unknown.log', 'asc').validate }.to raise_error(RuntimeError, missing_file_message)
      expect { described_class.new('webserver.txt', 'asc').validate }.to raise_error(RuntimeError, invalid_file_type_message)
      expect { described_class.new('webserver_empty.log', 'asc').validate }.to raise_error(RuntimeError, empty_file_message)
    end
  end

  context 'when an invalid sorting direction is provided!' do
    let(:invalid_sort_direction_message) { 'The provided sort direction is invalid. The valid options are \'asc, desc\'!' }

    it 'throws an error' do
      expect { described_class.new('webserver.log', 'xyz').validate }.to raise_error(RuntimeError, invalid_sort_direction_message)
    end
  end

  context 'when the file exists, has a valid type, and has logs in it!' do
    it 'does not throws an error' do
      result = described_class.new('webserver.log', 'asc').validate

      expect(result).to be_nil
    end
  end

  context 'when the provided page path is invalid' do
    it 'returns false if the path does not start with a forward slash' do
      result = described_class.valid_page?('about/2')

      expect(result).to be_nil
    end

    it 'returns false if the path contains invalid characters' do
      result = described_class.valid_page?('abo*&^ut/2')

      expect(result).to be_nil
    end
  end

  context 'when the provided page path is valid' do
    it 'returns true' do
      result = described_class.valid_page?('/about/2')

      expect(result).to eq(0)
    end
  end

  context 'when the provided IP is invalid' do
    it 'returns false' do
      result = described_class.valid_ip?('555.576.836.194')

      expect(result).to be_falsy
    end
  end

  context 'when the provided IP is valid' do
    it 'returns true' do
      result = described_class.valid_ip?('192.168.83.19')

      expect(result).to be_truthy
    end
  end
end
