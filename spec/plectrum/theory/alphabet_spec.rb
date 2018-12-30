RSpec.describe Plectrum::Theory::Alphabet do
  describe '.next' do
    context 'a scale of consecutive notes' do
      subject { described_class.new('C') }

      it 'returns the next scale degree' do
        expect(subject.next).to eq('D')
      end
    end

    context 'a scale of non-consecutive notes' do
      subject { described_class.new('G', enharmonics: ['B', 'C']) }

      it 'returns the next scale degree' do
        expect(subject.next).to eq('B')
      end
    end
  end
end
