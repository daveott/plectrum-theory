module Plectrum
  module Theory
    class Tone
      attr_accessor :tone

      def initialize(tone)
        self.tone = tone
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

      def resolve_enharmonic!(previous)
        self.tone = enharmonics.find do |enharmonic|
          enharmonic.start_with?(previous.codepoints.first.chr.next) || 'A'
        end
      end

      def to_s
        tone
      end
    end
  end
end

