RSpec.describe Plectrum::Theory::Pitch do
  describe '#next' do
    context 'C' do
      subject { described_class.new(step: 'C') }

      it 'returns C#/Db as the next pitch' do
        expect(subject.next(1)).to eq('C#/Db')
      end
    end

    context 'G' do
      subject { described_class.new(step: 'G') }

      it 'returns G#/Ab as the next pitch' do
        expect(subject.next(1)).to eq('G#/Ab')
      end
    end
  end

  describe '#previous' do
    context 'C' do
      subject { described_class.new(step: 'C') }

      it 'returns B as the previous pitch' do
        expect(subject.previous(1)).to eq('B')
      end
    end

    context 'A' do
      subject { described_class.new(step: 'A') }

      it 'returns G#/Ab as the previous pitch' do
        expect(subject.previous(1)).to eq('G#/Ab')
      end
    end
  end
end
