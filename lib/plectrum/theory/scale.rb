module Plectrum
  module Theory
    class Scale
      attr_reader :number, :root, :bitmask, :spelling

      def initialize(number:, root:, bitmask: 0)
        @number = number
        @root = root
        @bitmask = ToneBitmask.find(number)
        @spelling = [root]
      end

      def chromatic_pitches
        Pitch::NAMES[Pitch::NAMES.index do |t|
          t.split('/').include?(root)
        end,12]
      end

      def spell
        to_a.drop(1).map.with_object(spelling) do |degree, spelling|
          spelling << Pitch.new(name: degree, context: self).to_s
        end
      end

      def type
        ScaleType.find(to_a.size).name
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
        5 => 'pentatonic'
      }

      def self.find(num_tones)
        new(name: TYPES[num_tones])
      end
    end
  end
end
