RSpec.describe Plectrum::Theory::ToneBitmask do
  describe '.power_set' do
    it 'is a power_set of possibilities' do
      expect(Plectrum::Theory::ToneBitmask.power_set).to be_a(Range)
    end

    context '12 tone equal temperament' do
      it 'produces 4096 possibilities' do
        expect(Plectrum::Theory::ToneBitmask.power_set.size).to be(4096)
      end

      it 'begins at 0' do
        expect(Plectrum::Theory::ToneBitmask.power_set.first).to eq(0)
      end

      it 'ends at 4095' do
        expect(Plectrum::Theory::ToneBitmask.power_set.last).to eq(4095)
      end
    end
  end

  describe '.all' do
    it 'is all 4096 scale possibilities' do
      expect(Plectrum::Theory::ToneBitmask.all.size).to be(4096)
    end
  end

  describe '.find' do
    it 'returns the tone bitmask for the given integer' do
      expect(Plectrum::Theory::ToneBitmask.find(2741).bitmask).to eq('101010110101')
    end

    it 'returns an error if the number is not in the power set' do
      expect{Plectrum::Theory::ToneBitmask.find(4096)}.to raise_error(ArgumentError)
    end
  end
end
