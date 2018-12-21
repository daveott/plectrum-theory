RSpec.describe Plectrum::Theory::BinaryScale do
  describe '.range' do
    it 'is a range of possibilities' do
      expect(Plectrum::Theory::BinaryScale.range).to be_a(Range)
    end

    context '12 tone equal temperament' do
      it 'produces 4096 possibilities' do
        expect(Plectrum::Theory::BinaryScale.range.size).to be(4096)
      end

      it 'begins at 0' do
        expect(Plectrum::Theory::BinaryScale.range.first).to eq(0)
      end

      it 'ends at 4095' do
        expect(Plectrum::Theory::BinaryScale.range.last).to eq(4095)
      end
    end
  end

  describe '.all' do
    it 'is all 4096 scale possibilities' do
      expect(Plectrum::Theory::BinaryScale.all.size).to be(4096)
    end
  end

  describe '.find' do
    it 'returns the binary representation of the given integer' do
      expect(Plectrum::Theory::BinaryScale.find(2741)).to eq('101010110101')
    end

    it 'returns an error if the number is out of range' do
      expect{Plectrum::Theory::BinaryScale.find(4096)}.to raise_error(ArgumentError)
    end
  end
end
