# frozen_string_literal: true

require 'spec_helper'

describe Log::SortedCounter do
  context 'when all records are needed' do
    it 'gives view stats of all records' do
      views = described_class.new('webserver.log', uniq: false).count_and_sort

      expect(views).to be_kind_of(Array)
      expect(views[0]).to be_kind_of(Array)
    end
  end

  context 'when unique records are needed' do
    it 'gives view stats of unique records' do
      views = described_class.new('webserver.log', uniq: true).count_and_sort

      expect(views).to be_kind_of(Array)
      expect(views[0]).to be_kind_of(Array)
    end
  end

  context 'when records are needed in ascending order' do
    it 'gives view stats in ascending order' do
      views = described_class.new('webserver.log', uniq: true, sort_direction: 'asc').count_and_sort

      expect(views).to be_kind_of(Array)
      expect(views[0]).to be_kind_of(Array)
      expect(views[0][1]).to be <= views[views.length - 1][1]
    end
  end

  context 'when records are needed in descending order' do
    it 'gives view stats in descending order' do
      views = described_class.new('webserver.log', uniq: true, sort_direction: 'desc').count_and_sort

      expect(views).to be_kind_of(Array)
      expect(views[0]).to be_kind_of(Array)
      expect(views[0][1]).to be >= views[views.length - 1][1]
    end
  end
end
