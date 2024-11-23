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

    end
  end
end
