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
        scale_tones.map do |tone|
          enharmonics = tone.include?('/') && tone.split('/')
          if enharmonics
            spelling << enharmonics.find do |enharmonic|
              enharmonic.start_with?(spelling.last.codepoints.first.chr.next)
            end
          else
            spelling << tone
          end
        end
        spelling
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
  end
end
