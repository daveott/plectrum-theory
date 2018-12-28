module Plectrum
  module Theory
    class Scale
      attr_reader :number, :root, :bitmask, :spelling

      def initialize(number:, root:, bitmask: 0)
        @number = number
        @root = root
        @bitmask = ToneBitmask.find(number)
        @spelling = []
      end

      def spell
        to_a.map.with_object(spelling) do |tone, spelling|
          tone = Tone.new(tone)
          tone.resolve_enharmonic!(spelling.last) if tone.enharmonic?
          spelling << tone.to_s
        end
      end

      def chromatic_tones
        Pitch::STEPS[Pitch::STEPS.index(root),12]
      end

      def to_a
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_tones.zip(bitmask.to_a.reverse)]
      end
    end
  end
end
