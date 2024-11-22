RSpec.describe Plectrum::Theory::Interval do
  describe '.between' do
    context 'a perfect unison' do
      subject { described_class.between('A', 'A') }

      it 'returns the interval between the two notes' do
        expect(subject.unison?).to be true
      end
    end

    context 'a minor second' do
      subject { described_class.between('B', 'C') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_second?).to be true
      end
    end

    context 'a minor second with accidentals' do
      subject { described_class.between('A', 'Bb') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_second?).to be true
      end
    end

    context 'a minor second with accidentals' do
      subject { described_class.between('F', 'Gb') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_second?).to be true
      end
    end

    context 'a major second' do
      subject { described_class.between('A', 'B') }

      it 'returns the interval between the two notes' do
        expect(subject.major_second?).to be true
      end
    end

    context 'a major second with accidentals' do
      subject { described_class.between('E', 'F#') }

      it 'returns the interval between the two notes' do
        expect(subject.major_second?).to be true
      end
    end

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

    context 'a minor third with accidentals' do
      subject { described_class.between('G', 'Bb') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_third?).to be true
      end
    end

    context 'a major third' do
      subject { described_class.between('G', 'B') }

      it 'returns the interval between the two notes' do
        expect(subject.major_third?).to be true
      end
    end

    context 'a major third with accidentals' do
      subject { described_class.between('A', 'C#') }

      it 'returns the interval between the two notes' do
        expect(subject.major_third?).to be true
      end
    end

    context 'a perfect fourth' do
      subject { described_class.between('A', 'D') }

      it 'returns the interval between the two notes' do
        expect(subject.perfect_fourth?).to be true
      end
    end

    context 'an augmented fourth' do
      subject { described_class.between('G', 'C#') }

      it 'returns the interval between the two notes' do
        expect(subject.augmented_fourth?).to be true
      end
    end

    context 'a diminished fifth' do
      subject { described_class.between('G', 'Db') }

      it 'returns the interval between the two notes' do
        expect(subject.diminished_fifth?).to be true
      end
    end

    context 'a perfect fifth' do
      subject { described_class.between('G', 'D') }

      it 'returns the interval between the two notes' do
        expect(subject.perfect_fifth?).to be true
      end
    end

    context 'a minor sixth' do
      subject { described_class.between('G', 'Eb') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_sixth?).to be true
      end
    end

    context 'a major sixth' do
      subject { described_class.between('G', 'E') }

      it 'returns the interval between the two notes' do
        expect(subject.major_sixth?).to be true
      end
    end

    context 'a minor seventh' do
      subject { described_class.between('G', 'F') }

      it 'returns the interval between the two notes' do
        expect(subject.minor_seventh?).to be true
      end
    end

    context 'a major seventh' do
      subject { described_class.between('G', 'F#') }

      it 'returns the interval between the two notes' do
        expect(subject.major_seventh?).to be true
      end
    end
  end
end
