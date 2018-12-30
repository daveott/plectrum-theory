require 'active_support/core_ext/array'

module Plectrum
  module Theory
    class Alphabet
      NOTES = %w(C D E F G A B) * 2

      def self.next(previous, enharmonics: [])
        previous_index = NOTES.index(previous.gsub(/b|#/,''))
        if enharmonics.any?
          choices = Array.wrap(enharmonics).map do |choice|
            choice.gsub(/b|#/,'')
          end
          i = 0
          while i < NOTES.size
            i += 1
            if choices.include?(NOTES[previous_index+i])
              return NOTES[previous_index+i]
            end
          end
        end
        NOTES[previous_index+1]
      end
    end
  end
end
