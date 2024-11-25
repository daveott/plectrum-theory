#[
#  [[E], [F], [F_sharp, G_flat], [G], [G_sharp, A_flat], [A], [A_sharp, B_flat], [B], [C], [C_sharp, D_flat], [D], [D_sharp, E_flat], [E]],
#  [[B], [C], [C_sharp, D_flat], [D], [D_sharp, E_flat], [E], [F], [F_sharp, G_flat], [G], [G_sharp, A_flat], [A], [A_sharp, B_flat], [B]],
#  [[G], [G_sharp, A_flat], [A], [A_sharp, B_flat], [B], [C], [C_sharp, D_flat], [D], [D_sharp, E_flat], [E], [F], [F_sharp, G_flat], [G]],
#  [[D], [D_sharp, E_flat], [E], [F], [F_sharp, G_flat], [G], [G_sharp, A_flat], [A], [A_sharp, B_flat], [B], [C], [C_sharp, D_flat], [D]],
#  [[A], [A_sharp, B_flat], [B], [C], [C_sharp, D_flat], [D], [D_sharp, E_flat], [E], [F], [F_sharp, G_flat], [G], [G_sharp, A_flat], [A]],
#  [[E], [F], [F_sharp, G_flat], [G], [G_sharp, A_flat], [A], [A_sharp, B_flat], [B], [C], [C_sharp, D_flat], [D], [D_sharp, E_flat], [E]]
#]
RSpec.describe Plectrum::Theory::Fretboard do
  subject { described_class.new tuning: tuning, fret_count: 12}

  describe '#highlight_notes' do
    context 'standard tuning' do
      let(:tuning) { :standard }

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
  end

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
end
