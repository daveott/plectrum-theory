RSpec.describe Plectrum::Theory::KeySignature do
  context 'C' do
    subject { described_class.new('C') }

    it "has no accidentals" do
      expect(subject.accidentals).to be_empty
    end

    it "has no sharps" do
      expect(subject.sharps?).to be false
    end

    it "has no flats" do
      expect(subject.flats?).to be false
    end
  end

  context 'G' do
    subject { described_class.new('G') }

    it "has one sharp" do
      expect(subject.accidentals).to eq(['F#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'D' do
    subject { described_class.new('D') }

    it "has two sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'A' do
    subject { described_class.new('A') }

    it "has three sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'E' do
    subject { described_class.new('E') }

    it "has four sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'B' do
    subject { described_class.new('B') }

    it "has five sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#', 'A#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'F#' do
    subject { described_class.new('F#') }

    it "has six sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#', 'A#', 'E#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'C#' do
    subject { described_class.new('C#') }

    it "has seven sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#', 'A#', 'E#', 'B#'])
    end

    it "has sharps" do
      expect(subject.sharps?).to be true
    end
  end

  context 'F' do
    subject { described_class.new('F') }

    it "has one flat" do
      expect(subject.accidentals).to eq(['Bb'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Bb' do
    subject { described_class.new('Bb') }

    it "has two flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Eb' do
    subject { described_class.new('Eb') }

    it "has three flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Ab' do
    subject { described_class.new('Ab') }

    it "has four flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Db' do
    subject { described_class.new('Db') }

    it "has five flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db', 'Gb'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Gb' do
    subject { described_class.new('Gb') }

    it "has six flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db', 'Gb', 'Cb'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'Cb' do
    subject { described_class.new('Cb') }

    it "has seven flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db', 'Gb', 'Cb', 'Fb'])
    end

    it "has flats" do
      expect(subject.flats?).to be true
    end
  end

  context 'a minor' do
    subject { described_class.new('a', 'minor') }

    it "has no accidentals" do
      expect(subject.accidentals).to eq([])
    end
  end

  context 'e minor' do
    subject { described_class.new('e', 'minor') }

    it "has one sharp" do
      expect(subject.accidentals).to eq(['F#'])
    end
  end

  context 'b minor' do
    subject { described_class.new('b', 'minor') }

    it "has two sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#'])
    end
  end

  context 'f# minor' do
    subject { described_class.new('f#', 'minor') }

    it "has three sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#'])
    end
  end

  context 'c# minor' do
    subject { described_class.new('c#', 'minor') }

    it "has four sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#'])
    end
  end

  context 'g# minor' do
    subject { described_class.new('g#', 'minor') }

    it "has five sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#', 'A#'])
    end
  end

  context 'd# minor' do
    subject { described_class.new('d#', 'minor') }

    it "has six sharps" do
      expect(subject.accidentals).to eq(['F#', 'C#', 'G#', 'D#', 'A#', 'E#'])
    end
  end

  context 'eb minor' do
    subject { described_class.new('eb', 'minor') }

    it "has six flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db', 'Gb', 'Cb'])
    end
  end

  context 'bb minor' do
    subject { described_class.new('bb', 'minor') }

    it "has five flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db', 'Gb'])
    end
  end

  context 'f minor' do
    subject { described_class.new('f', 'minor') }

    it "has four flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab', 'Db'])
    end
  end

  context 'c minor' do
    subject { described_class.new('c', 'minor') }

    it "has three flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb', 'Ab'])
    end
  end

  context 'g minor' do
    subject { described_class.new('g', 'minor') }

    it "has two flats" do
      expect(subject.accidentals).to eq(['Bb', 'Eb'])
    end
  end

  context 'd minor' do
    subject { described_class.new('d', 'minor') }

    it "has one flat" do
      expect(subject.accidentals).to eq(['Bb'])
    end
  end

  describe '#sharps?' do
    subject { described_class.new(key).sharps? }

    context 'when the key signature has no sharps' do
      let(:key) { 'C' }

      it "returns false" do
        expect(subject).to be false
      end
    end

    context 'when the key signature has sharps' do
      let(:key) { 'G' }

      it "returns true" do
        expect(subject).to be true
      end
    end
  end

  describe '#flats?' do
    subject { described_class.new(key).flats? }

    context 'when the key signature has no flats' do
      let(:key) { 'C' }

      it "returns false" do
        expect(subject).to be false
      end
    end

    context 'when the key signature has flats' do
      let(:key) { 'Gb' }

      it "returns true" do
        expect(subject).to be true
      end
    end
  end

  describe '#relative_major' do
    context 'when the key signature is a major key' do
      subject { described_class.new('C').relative_major }

      it "returns the relative major key" do
        expect(subject).to eq('C')
      end
    end

    context 'when the key signature is a minor key' do
      subject { described_class.new('a', 'minor').relative_major }

      it "returns the relative major key" do
        expect(subject).to eq('C')
      end
    end
  end

  describe '#relative_minor' do
    context 'when the key signature is a major key' do
      subject { described_class.new('C').relative_minor }

      it "returns the relative minor key" do
        expect(subject).to eq('a')
      end
    end

    context 'when the key signature is a minor key' do
      subject { described_class.new('a', 'minor').relative_minor }

      it "returns the relative minor key" do
        expect(subject).to eq('a')
      end
    end
  end
end
