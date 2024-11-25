RSpec.describe Plectrum::Theory::Fretboard do
  subject { described_class.new tuning: tuning, fret_count: 12}

  describe '#matrix' do
    context 'standard tuning' do
      let(:tuning) { :standard }

      it "represents all 6 strings" do
        expect(subject.matrix.size).to eq(6)
      end

      it "represents the high E string" do
        expect(subject.matrix[5]).to eq(
          [
            ['E'],
            ['E#', 'F'],
            ['F#', 'Gb'],
            ['G'],
            ['G#', 'Ab'],
            ['A'],
            ['A#', 'Bb'],
            ['B', 'Cb'],
            ['B#', 'C'],
            ['C#', 'Db'],
            ['D'],
            ['D#', 'Eb'],
            ['E'] ]
        )
      end

      it "represents the A string" do
        expect(subject.matrix[4]).to eq(
          [ 
            ['A'],
            ['A#', 'Bb'],
            ['B', 'Cb'],
            ['B#', "C"],
            ['C#', 'Db'],
            ['D'],
            ['D#', 'Eb'],
            ['E'],
            ['E#', 'F'],
            ['F#', 'Gb'],
            ['G'],
            ['G#', 'Ab'],
            ['A'] ]
        )
      end

      it "represents the D string" do
        expect(subject.matrix[3]).to eq(
          [ 
            ['D'],
            ['D#', 'Eb'],
            ['E'],
            ['E#', "F"],
            ['F#', 'Gb'],
            ['G'],
            ['G#', 'Ab'],
            ['A'],
            ['A#', 'Bb'],
            ['B', 'Cb'],
            ['B#', 'C'],
            ['C#', 'Db'],
            ['D'] ]
        )
      end

      it "represents the G string" do
        expect(subject.matrix[2]).to eq(
          [ 
            ['G'],
            ['G#', 'Ab'],
            ['A'],
            ['A#', "Bb"],
            ['B', 'Cb'],
            ['B#', 'C'],
            ['C#', 'Db'],
            ['D'],
            ['D#', 'Eb'],
            ['E'],
            ['E#', 'F'],
            ['F#', 'Gb'],
            ['G'] ]
        )
      end

      it "represents the B string" do
        expect(subject.matrix[1]).to eq(
          [ 
            ['B/Cb'],
            ['B#', 'C'],
            ['C#', 'Db'],
            ['D'],
            ['D#', 'Eb'],
            ['E'],
            ['E#', 'F'],
            ['F#', 'Gb'],
            ['G'],
            ['G#', 'Ab'],
            ['A'],
            ['A#', 'Bb'],
            ['B', 'Cb'] ]
        )
      end

      it "represents the high E string" do
        expect(subject.matrix[0]).to eq(
          [ 
            ['E'],
            ['E#', 'F'],
            ['F#', 'Gb'],
            ['G'],
            ['G#', 'Ab'],
            ['A'],
            ['A#', 'Bb'],
            ['B', 'Cb'],
            ['B#', 'C'],
            ['C#', 'Db'],
            ['D'],
            ['D#', 'Eb'],
            ['E'] ]
        )
      end
    end
  end

  describe '#highlight_notes' do
    let(:tuning) { :standard }

    context 'standard tuning' do
      context 'with no notes' do
        it "draws the fretboard with no notes highlighted" do
          notes = subject.highlight_notes
          expect(notes.flatten.count { |n| n.include?('*') }).to eq(0)
        end
      end

      context 'with a single note' do
        it "draws the fretboard with the note highlighted" do
          notes = subject.highlight_notes("A")
          expect(notes.flatten.count { |n| n.include?('*') }).to eq(7)
        end
      end

      context 'with multiple notes' do
        it "draws the fretboard with the notes highlighted" do
          notes = subject.highlight_notes(%w(A D))
          expect(notes.flatten.count { |n| n.include?('*') }).to eq(14)
        end
      end

      context 'with enharmonic notes' do
        it "draws the fretboard with the notes highlighted" do
          notes = subject.highlight_notes(%w(G# Ab))
          expect(notes.flatten.count { |n| n.include?('*') }).to eq(12)
        end
      end

      context 'with a position' do
        context 'at the 5th fret' do
          it "draws the fretboard with the notes highlighted" do
            notes = subject.highlight_notes(%w(A B C# D E F# G#), position: 4..7)
            expect(notes.flatten.count { |n| n.include?('*') }).to eq(17)
          end
        end
      end
    end

    context 'with string groups E B G' do
      it "draws the fretboard with the notes highlighted" do
        notes = subject.highlight_notes(%w(A D), string_groups: [0, 1, 2])
        expect(notes.flatten.count { |n| n.include?('*') }).to eq(6)
      end
    end

    context 'with string groups B G D' do
      it "draws the fretboard with the notes highlighted" do
        notes = subject.highlight_notes(%w(A D), string_groups: [1, 2, 3])
        expect(notes.flatten.count { |n| n.include?('*') }).to eq(7)
      end
    end

    context 'with string groups B G D in the 5th position' do
      it "draws the fretboard with the notes highlighted" do
        notes = subject.highlight_notes(%w(A C E), position: 4..7, string_groups: [1, 2, 3])
        expect(notes.flatten.count { |n| n.include?('*') }).to eq(3)
      end
    end
  end
end
