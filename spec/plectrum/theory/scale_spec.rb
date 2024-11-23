RSpec.describe Plectrum::Theory::Scale do
  describe '.sample' do
    subject { described_class.sample }

    it 'returns a Scale' do
      expect(subject).to be_a(described_class)
    end
  end

  describe '#spell' do
    context 'E chromatic scale' do
      subject { described_class.new(tonic: 'E', number: 4095) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E E#/F F#/Gb G G#/Ab A A#/Bb B/Cb B#/C C#/Db D D#/Eb))
      end

      it 'is a chromatic scale' do
        expect(subject.chromatic?).to be true
      end
    end

    context 'C# chromatic scale' do
      subject { described_class.new(tonic: 'C#', number: 4095) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C#/Db D D#/Eb E E#/F F#/Gb G G#/Ab A A#/Bb B/Cb B#/C))
      end

      it 'is a chromatic scale' do
        expect(subject.chromatic?).to be true
      end
    end

    context 'C Major' do
      subject { described_class.new(tonic: 'C', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E F G A B))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'G Major' do
      subject { described_class.new(tonic: 'G', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G A B C D E F#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'D Major' do
      subject { described_class.new(tonic: 'D', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D E F# G A B C#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'A Major' do
      subject { described_class.new(tonic: 'A', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(A B C# D E F# G#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'E Major' do
      subject { described_class.new(tonic: 'E', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E F# G# A B C# D#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'B Major' do
      subject { described_class.new(tonic: 'B', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(B C# D# E F# G# A#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'F# Major' do
      subject { described_class.new(tonic: 'F#', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# G# A# B C# D# E#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Gb Major' do
      subject { described_class.new(tonic: 'Gb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Gb Ab Bb Cb Db Eb F))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Db Major' do
      subject { described_class.new(tonic: 'Db', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Db Eb F Gb Ab Bb C))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'C# Major' do
      subject { described_class.new(tonic: 'C#', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C# D# E# F# G# A# B#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Ab Major' do
      subject { described_class.new(tonic: 'Ab', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Ab Bb C Db Eb F G))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Eb Major' do
      subject { described_class.new(tonic: 'Eb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Eb F G Ab Bb C D))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Bb Major' do
      subject { described_class.new(tonic: 'Bb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Bb C D Eb F G A))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'F Major' do
      subject { described_class.new(tonic: 'F', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F G A Bb C D E))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'A Minor' do
      subject { described_class.new(tonic: 'A', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(A B C D E F G))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'E Minor' do
      subject { described_class.new(tonic: 'E', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E F# G A B C D))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'B Minor' do
      subject { described_class.new(tonic: 'B', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(B C# D E F# G A))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'F# Minor' do
      subject { described_class.new(tonic: 'F#', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# G# A B C# D E))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'C# Minor' do
      subject { described_class.new(tonic: 'C#', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C# D# E F# G# A B))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'G# Minor' do
      subject { described_class.new(tonic: 'G#', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G# A# B C# D# E F#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'D# Minor' do
      subject { described_class.new(tonic: 'D#', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D# E# F# G# A# B C#))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'Bb Minor' do
      subject { described_class.new(tonic: 'Bb', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Bb C Db Eb F Gb Ab))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'F Minor' do
      subject { described_class.new(tonic: 'F', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F G Ab Bb C Db Eb))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'C Minor' do
      subject { described_class.new(tonic: 'C', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D Eb F G Ab Bb))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'G Minor' do
      subject { described_class.new(tonic: 'G', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G A Bb C D Eb F))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'D Minor' do
      subject { described_class.new(tonic: 'D', number: 1453) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D E F G A Bb C))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'D Dorian Mode' do
      subject { described_class.new(tonic: 'D', number: 1709) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D E F G A B C))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'F# Phrygian Mode' do
      subject { described_class.new(tonic: 'F#', number: 1451) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# G A B C# D E))
      end

      it 'is a heptatonic scale' do
        expect(subject.heptatonic?).to be true
      end
    end

    context 'C Major Pentatonic' do
      subject { described_class.new(tonic: 'C', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E G A))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'A Major Pentatonic' do
      subject { described_class.new(tonic: 'A', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(A B C# E F#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'A Minor Pentatonic' do
      subject { described_class.new(tonic: 'A', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(A C D E G))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'E Major Pentatonic' do
      subject { described_class.new(tonic: 'E', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E F# G# B C#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'E Minor Pentatonic' do
      subject { described_class.new(tonic: 'E', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E G A B D))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'B Major Pentatonic' do
      subject { described_class.new(tonic: 'B', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(B C# D# F# G#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'B Minor Pentatonic' do
      subject { described_class.new(tonic: 'B', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(B D E F# A))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'F# Major Pentatonic' do
      subject { described_class.new(tonic: 'F#', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# G# A# C# D#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'F# Minor Pentatonic' do
      subject { described_class.new(tonic: 'F#', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# A B C# E))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'C# Minor Pentatonic' do
      subject { described_class.new(tonic: 'C#', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C# E F# G# B))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'C# Major Pentatonic' do
      subject { described_class.new(tonic: 'C#', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C# D# E# G# A#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'G# Minor Pentatonic' do
      subject { described_class.new(tonic: 'G#', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G# B C# D# F#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'G# Major Pentatonic' do
      subject { described_class.new(tonic: 'G#', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G# A# B# D# E#))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'Eb Minor Pentatonic' do
      subject { described_class.new(tonic: 'Eb', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Eb Gb Ab Bb Db))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'Eb Major Pentatonic' do
      subject { described_class.new(tonic: 'Eb', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Eb F G Bb C))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'Bb Minor Pentatonic' do
      subject { described_class.new(tonic: 'Bb', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Bb Db Eb F Ab))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'Bb Major Pentatonic' do
      subject { described_class.new(tonic: 'Bb', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Bb C D F G))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'F Minor Pentatonic' do
      subject { described_class.new(tonic: 'F', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F Ab Bb C Eb))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'F Major Pentatonic' do
      subject { described_class.new(tonic: 'F', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F G A C D))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'C Minor Pentatonic' do
      subject { described_class.new(tonic: 'C', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C Eb F G Bb))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'C Major Pentatonic' do
      subject { described_class.new(tonic: 'C', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E G A))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'G Minor Pentatonic' do
      subject { described_class.new(tonic: 'G', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G Bb C D F))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'G Major Pentatonic' do
      subject { described_class.new(tonic: 'G', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G A B D E))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'D Minor Pentatonic' do
      subject { described_class.new(tonic: 'D', number: 1193) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D F G A C))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'D Major Pentatonic' do
      subject { described_class.new(tonic: 'D', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D E F# A B))
      end

      it 'is a pentatonic scale' do
        expect(subject.pentatonic?).to be true
      end
    end

    context 'C Whole Tone' do
      subject { described_class.new(tonic: 'C', number: 1365) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E F# G# A#))
      end

      it 'is a hexatonic scale' do
        expect(subject.hexatonic?).to be true
      end
    end

    context 'C Diminished' do
      subject { described_class.new(tonic: 'C', number: 2925) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D Eb F Gb Ab A B))
      end

      it 'is a octatonic scale' do
        expect(subject.octatonic?).to be true
      end
    end
  end
end
