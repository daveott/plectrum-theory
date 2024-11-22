require 'active_support/core_ext/array'

module Plectrum
  module Theory
    class Alphabet
      attr_reader :letter, :enharmonics

      NOTES = %w(C D E F G A B) * 2

      DISTANCES = {
          1 => ['unison', 0],
          2 => ['second', 2],
          3 => ['third', 4],
          4 => ['fourth', 6],
          5 => ['fifth', 8],
          6 => ['sixth', 10],
          7 => ['seventh', 12],
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
        [distance == 1 ? 0 : DISTANCES[distance].last, DISTANCES[distance].first]
      end

      def steps_to(b)
        a = NOTES[NOTES.index(letter)..-1]
        a[a.index(letter)..a.index(Util.naturalize(b))]
      end
    end
  end
end
