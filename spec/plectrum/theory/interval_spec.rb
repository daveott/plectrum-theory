RSpec.describe Plectrum::Theory::Interval do
  describe '.between' do
    context 'an augmented second' do
      subject { described_class.between('A', 'B#') }

      it 'returns the interval between the two notes' do
        expect(subject.augmented_second?).to be true
      end
    end

    context 'a minor third' do
      subject { described_class.between('A', 'C') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_third?).to be true
      end
    end

    context 'a major second' do
      subject { described_class.between('E', 'F#') }

      it 'returns the interval between the two notes' do
        expect(subject.major_second?).to be true
      end
    end
  end
end
