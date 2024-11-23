module Plectrum
  module Theory
    class Scale
      attr_reader :name, :number, :root, :bitmask, :spelling

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
          root: SCALES.keys.sample(1).first,
        )
      end

      def initialize(number:, root:, bitmask: nil)
        @number = number
        @root = root
        @bitmask = bitmask || ToneBitmask.find(number)
        @spelling = [root]
        @name = [root, ToneBitmask::COMMON_TONE_BITMASKS.fetch(number, 'unknown')].join(' ')
      end

      def chromatic_pitches
        pitches = Pitch::NAMES[Pitch::NAMES.index do |t|
          t.split('/').include?(root)
        end, 12]
      end

      def spell
        return chromatic_pitches if chromatic?

        to_a.drop(1).map.with_object(spelling) do |degree, spelling|
          spelling << Pitch.new(name: degree, context: self).to_s
        end
      end

      def type
        ScaleType.find(to_a.size)
      end

      def chromatic?
        type.chromatic?
      end

      def heptatonic?
        type.heptatonic?
      end

      def pentatonic?
        type.pentatonic?
      end

      def to_a
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_pitches.zip(bitmask.to_a.reverse)]
      end
    end

    class ScaleType < OpenStruct
      TYPES = {
        7 => 'heptatonic',
        5 => 'pentatonic',
        12 => 'chromatic'
      }

      def self.find(num_tones)
        new(name: TYPES[num_tones])
      end

      def heptatonic?
        name == 'heptatonic'
      end

      def pentatonic?
        name == 'pentatonic'
      end

      def chromatic?
        name == 'chromatic'
      end
    end
  end
end
