RSpec.describe Plectrum::Theory::Scale do
  describe '#spell' do
    context 'C Major' do
      context 'with a bitmask' do
        subject { described_class.new(root: 'C', number: 2741) }

        it 'spells the scale' do
          expect(subject.spell).to eq(%w(C D E F G A B))
        end
      end
    end
  end
end
