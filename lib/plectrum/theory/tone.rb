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

      def resolve_enharmonic!(previous)
        self.tone = enharmonics.find do |enharmonic|
          enharmonic.include?(previous.codepoints.first.chr.next)
        end || enharmonics.find do |enharmonic|
          enharmonic.start_with?('A')
        end
      end

      def to_s
        tone
      end
    end
  end
end

