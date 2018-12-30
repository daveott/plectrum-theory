RSpec.describe Plectrum::Theory::Scale do
  describe '#spell' do
    context 'C Major' do
      subject { described_class.new(root: 'C', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E F G A B))
      end
    end

    context 'G Major' do
      subject { described_class.new(root: 'G', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(G A B C D E F#))
      end
    end

    context 'D Major' do
      subject { described_class.new(root: 'D', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(D E F# G A B C#))
      end
    end

    context 'A Major' do
      subject { described_class.new(root: 'A', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(A B C# D E F# G#))
      end
    end

    context 'E Major' do
      subject { described_class.new(root: 'E', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E F# G# A B C# D#))
      end
    end

    context 'B Major' do
      subject { described_class.new(root: 'B', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(B C# D# E F# G# A#))
      end
    end

    context 'F# Major' do
      subject { described_class.new(root: 'F#', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F# G# A# B C# D# E#))
      end
    end

    context 'Gb Major' do
      subject { described_class.new(root: 'Gb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Gb Ab Bb Cb Db Eb F))
      end
    end

    context 'Db Major' do
      subject { described_class.new(root: 'Db', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Db Eb F Gb Ab Bb C))
      end
    end

    context 'C# Major' do
      subject { described_class.new(root: 'C#', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C# D# E# F# G# A# B#))
      end
    end

    context 'Ab Major' do
      subject { described_class.new(root: 'Ab', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Ab Bb C Db Eb F G))
      end
    end

    context 'Eb Major' do
      subject { described_class.new(root: 'Eb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Eb F G Ab Bb C D))
      end
    end

    context 'Bb Major' do
      subject { described_class.new(root: 'Bb', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(Bb C D Eb F G A))
      end
    end

    context 'F Major' do
      subject { described_class.new(root: 'F', number: 2741) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(F G A Bb C D E))
      end
    end

    context 'C Major Pentatonic' do
      subject { described_class.new(root: 'C', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(C D E G A))
      end
    end

    context 'E Major Pentatonic' do
      subject { described_class.new(root: 'E', number: 661) }

      it 'spells the scale' do
        expect(subject.spell).to eq(%w(E F# G# B C#))
      end
    end
  end
end
