RSpec.describe Plectrum::Theory::Alphabet do
  describe '.next' do
    context 'a scale of consecutive notes' do
      subject { described_class.next('C') }

      it 'returns the next scale degree' do
        expect(subject).to eq('D')
      end
    end

    context 'a scale of non-consecutive notes' do
      subject { described_class.next('G#', enharmonics: ['B', 'Cb']) }

      it 'returns the next scale degree' do
        expect(subject).to eq('B')
      end
    end
  end
end
