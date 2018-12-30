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

      def chromatic_tones
        Pitch::STEPS[Pitch::STEPS.index do |t|
          t.split('/').include?(root)
        end,12]
      end

      def spell
        to_a.drop(1).map.with_object(spelling) do |tone, spelling|
          tone = Tone.new(tone)
          tone.resolve_enharmonic!(spelling.last) if tone.enharmonic?
          spelling << tone.to_s
        end
      end

      def type
        ScaleType.find(to_a.size).name
      end

      def to_a
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_tones.zip(bitmask.to_a.reverse)]
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
