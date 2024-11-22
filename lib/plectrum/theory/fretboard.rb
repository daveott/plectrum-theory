module Plectrum
  module Theory
    class Fretboard
      attr_reader :tuning, :fret_count, :strings

      def initialize(tuning: :standard, fret_count: 22)
        @tuning = GuitarTuning.new tuning
        @fret_count = fret_count
        @strings = []
      end

      def matrix
        tuning.open_string_notes.map do |note|
          [[note]].tap do |string|
            while string.size < fret_count + 1 do
              string << Pitch.new(
                name: string.last&.join("/")
              ).next.split("/")
            end
            strings << string
          end
        end
        strings
      end
    end
  end
end
