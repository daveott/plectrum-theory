module Plectrum
  module Theory
    class Scale
      attr_reader :number, :root, :bitmask
      attr_accessor :spelling

      def initialize(number:, root:, bitmask: 0)
        @number = number
        @root = root
        @bitmask = ToneBitmask.find(number)
        self.spelling = []
      end

      def spell
        scale_tones.map.with_object(spelling) do |tone, spelling|
          tone = Tone.new(tone, spelling: spelling)
          spelling << tone.with_enharmonics
        end
      end

      def chromatic_tones
        Pitch::STEPS[Pitch::STEPS.index(root),12]
      end

      def scale_tones
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_tones.zip(bitmask.to_a.reverse)]
      end

      def complete?
        spelling.size == (bitmask.length - 1)
      end
    end

    class Tone
      attr_reader :spelling, :tone

      def initialize(tone, spelling: nil)
        @tone = tone
        @spelling = spelling
      end

      def enharmonic?
        tone.include?('/')
      end

      def enharmonics
        tone.split('/')
      end

      def with_enharmonics
        enharmonic? ? select_enharmonic : to_s
      end

      def select_enharmonic
        enharmonics.find do |enharmonic|
          enharmonic.start_with?(spelling.last.codepoints.first.chr.next)
        end
      end

      def to_s
        tone
      end
    end
  end
end
