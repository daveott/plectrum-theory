RSpec.describe Plectrum::Theory::Pitch do
  describe '#next' do
    context 'C' do
      subject { described_class.new(step: 'C') }

      it 'returns the next pitch' do
        expect(subject.next(1)).to eq('D')
      end
    end

    context 'G' do
      subject { described_class.new(step: 'G') }

      it 'returns the next pitch' do
        expect(subject.next(1)).to eq('A')
      end
    end
  end

  describe '#previous' do
    context 'C' do
      subject { described_class.new(step: 'C') }

      it 'returns the previous pitch' do
        expect(subject.previous(1)).to eq('B')
      end
    end

    context 'A' do
      subject { described_class.new(step: 'A') }

      it 'returns the previous pitch' do
        expect(subject.previous(1)).to eq('G')
      end
    end
  end
end
