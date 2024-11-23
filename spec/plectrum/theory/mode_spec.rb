RSpec.describe Plectrum::Theory::Mode do
  xdescribe '.sample' do
    subject { described_class.sample }

    it 'returns a Mode' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#spell' do
    context 'C Ionian' do
      subject { described_class.new("C", "ionian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(C D E F G A B))
      end
    end


    context 'D Dorian' do
      subject { described_class.new("D", "dorian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(D E F G A B C))
      end
    end

    context 'E Phrygian' do
      subject { described_class.new("E", "phrygian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(E F G A B C D))
      end
    end

    context 'F Lydian' do
      subject { described_class.new("F", "lydian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(F G A B C D E))
      end
    end

    context 'G Mixolydian' do
      subject { described_class.new("G", "mixolydian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(G A B C D E F))
      end
    end

    context 'A Aeolian' do
      subject { described_class.new("A", "aeolian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(A B C D E F G))
      end
    end

    context 'B Locrian' do
      subject { described_class.new("B", "locrian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(B C D E F G A))
      end
    end

    context 'Bb Ionian' do
      subject { described_class.new("Bb", "ionian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(Bb C D Eb F G A))
      end
    end

    context 'C Dorian' do
      subject { described_class.new("C", "dorian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(C D Eb F G A Bb))
      end
    end

    context 'C# Ionian' do
      subject { described_class.new("C#", "ionian") }

      it 'returns the correct spelling' do
        expect(subject.spell).to eq(%w(C# D# E# F# G# A# B#))
      end
    end
  end

  describe '#key' do
    context 'C Ionian' do
      subject { described_class.new("C", "ionian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'D Dorian' do
      subject { described_class.new("D", "dorian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end
    
    context 'E Phrygian' do
      subject { described_class.new("E", "phrygian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'F Lydian' do
      subject { described_class.new("F", "lydian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'G Mixolydian' do
      subject { described_class.new("G", "mixolydian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'A Aeolian' do
      subject { described_class.new("A", "aeolian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'B Locrian' do
      subject { described_class.new("B", "locrian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("C")
      end
    end

    context 'Bb Ionian' do
      subject { described_class.new("Bb", "ionian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("Bb")
      end
    end

    context 'C Dorian' do
      subject { described_class.new("C", "dorian") }

      it 'returns the correct key' do
        expect(subject.key).to eq("Bb")
      end
    end
  end

  describe '#quality' do
    context 'Ionian' do
      subject { described_class.new("C", "ionian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("major")
      end
    end

    context 'Dorian' do
      subject { described_class.new("D", "dorian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("minor")
      end
    end

    context 'Phrygian' do
      subject { described_class.new("E", "phrygian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("minor")
      end
    end

    context 'Lydian' do
      subject { described_class.new("F", "lydian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("major")
      end
    end

    context 'Mixolydian' do
      subject { described_class.new("G", "mixolydian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("dominant")
      end
    end

    context 'Aeolian' do
      subject { described_class.new("A", "aeolian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("minor")
      end
    end

    context 'Locrian' do
      subject { described_class.new("B", "locrian") }

      it 'returns the correct quality' do
        expect(subject.quality).to eq("diminished")
      end
    end
  end
end
