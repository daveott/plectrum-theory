require 'active_support/core_ext/array'

module Plectrum
  module Theory
    class Alphabet
      attr_reader :previous, :enharmonics

      NOTES = %w(C D E F G A B) * 2

      def initialize(previous, enharmonics: [])
        @previous = previous
        @enharmonics = enharmonics
      end

      def previous_index
        @previous_index ||= NOTES.index(previous)
      end

      def next
        for i in 1..NOTES.size
          note = NOTES[previous_index + i]
          return note if enharmonics.include?(note)
        end if enharmonics.any?
        NOTES[previous_index + 1]
      end
    end
  end
end
