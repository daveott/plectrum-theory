require 'active_support/core_ext/array'

module Plectrum
  module Theory
    class Alphabet
      attr_reader :previous, :enharmonics

      NOTES = %w(C D E F G A B) * 2

      def initialize(previous, enharmonics: [])
        self.previous = previous
        self.enharmonics = enharmonics
      end

      def previous=(value)
        @previous ||= strip_accidentals(value)
      end

      def enharmonics=(values)
        @enharmonics ||= values.map do |value|
          strip_accidentals(value)
        end
      end

      def next
        previous_index = NOTES.index(previous)
        if enharmonics.any?
          i = 0
          while i < NOTES.size
            i += 1
            if enharmonics.include?(NOTES[previous_index+i])
              return NOTES[previous_index+i]
            end
          end
        end
        NOTES[previous_index+1]
      end

      private
      def strip_accidentals(value)
        value.gsub(/b|#/,'')
      end
    end
  end
end
