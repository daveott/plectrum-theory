require 'plectrum/theory/spellable'

module Plectrum
  module Theory
    class Scale
      include Plectrum::Theory::Spellable

      attr_reader :name, :number, :tonic, :bitmask, :spelling

      NON_ENHARMONIC_SCALES = {
        'C' => %w(C D E F G A B),
        'G' => %w(G A B C D E F#),
        'D' => %w(D E F# G A B C#),
        'A' => %w(A B C# D E F# G#),
        'E' => %w(E F# G# A B C# D#),
        'B' => %w(B C# D# E F# G# A#),
        'Gb' => %w(Gb Ab Bb Cb Db Eb F),
        'Db' => %w(Db Eb F Gb Ab Bb C),
        'Ab' => %w(Ab Bb C Db Eb F G),
        'Eb' => %w(Eb F G Ab Bb C D),
        'Bb' => %w(Bb C D Eb F G A),
        'F' => %w(F G A Bb C D E)
      }

      ENHARMONIC_SCALES = {
        'Cb' => %w(Cb Db Eb Fb Gb Ab Bb),
        'F#' => %w(F# G# A# B C# D# E#),
        'C#'=> %w(C# D# E# F# G# A# B#)
      }

      SCALES = NON_ENHARMONIC_SCALES.merge(ENHARMONIC_SCALES)

      CIRCLE_OF_FIFTHS = NON_ENHARMONIC_SCALES.keys
      CIRCLE_OF_FOURTHS = NON_ENHARMONIC_SCALES.keys.reverse

      def self.sample
        new(
          number: ToneBitmask.sample.bitmask,
          tonic: SCALES.keys.sample(1).first,
        )
      end

      def initialize(number:, tonic:, bitmask: nil)
        @number = number
        @tonic = tonic
        @bitmask = bitmask || ToneBitmask.find(number)
        @spelling = [tonic]
        @name = [tonic, ToneBitmask::COMMON_TONE_BITMASKS.fetch(number, 'unknown')].join(' ')
      end

      def bits
        @bits ||= bitmask.to_i
      end

      def formula
        steps, indices = [], []

        # Collect the indices of the notes (1's)
        bits.each_with_index { |note, i| indices << i if note == 1 }

        # Calculate the steps between consecutive notes
        indices.each_cons(2) { |i1, i2| steps << (i2 - i1) }

        # Add the step from the last note back to the first (wraparound)
        steps << (bits.size - indices.last + indices.first)

        # Convert semitone distances into whole/half steps
        steps.map do |semitones|
          case semitones
          when 1 then "H" # Half step
          when 2 then "W" # Whole step
          when 3 then "W+H" # Whole step + half step
          else "#{semitones} semitones" # Handle unexpected gaps
          end
        end
      end
    end
  end
end
