require 'active_support/core_ext/array'

module Plectrum
  module Theory
    class Alphabet
      attr_reader :letter, :enharmonics

      NOTES = %w(C D E F G A B) * 2

      DISTANCES = {
          1 => 'unison',
          2 => 'second',
          3 => 'third',
          4 => 'fourth',
          5 => 'fifth',
          6 => 'sixth',
          7 => 'seventh',
          8 => 'octave'
      }

      def initialize(letter, enharmonics: [])
        @letter = Util.naturalize(letter)
        @enharmonics = enharmonics
      end

      def letter_index
        @letter_index ||= NOTES.index(letter)
      end

      def next
        for i in 1..NOTES.size
          note = NOTES[letter_index + i]
          return note if enharmonics.include?(note)
        end if enharmonics.any?
        NOTES[letter_index + 1]
      end

      def next_distance(b)
        a = NOTES[NOTES.index(letter)..-1]
        distance = a[a.index(letter)..a.index(b)].size
        [distance, DISTANCES[distance]]
      end
    end
  end
end
