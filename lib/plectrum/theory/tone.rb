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
          enharmonic.include?(Alphabet.next(previous))
        end
      end

      def to_s
        tone
      end
    end

    class Alphabet
      NOTES = %w(C D E F G A B) * 2

      def self.next(previous)
        NOTES[NOTES.index(previous.gsub(/b|#/,'')) + 1]
      end
    end
  end
end
