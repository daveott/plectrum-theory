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
        tuning.open_string_notes.reverse.map do |note|
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

      def highlight_notes(notes=[], root: nil, position: nil, string_groups: nil)
        return matrix if notes.empty?

        min_fret, max_fret = if position.is_a?(Range)
          [position.begin, position.end] 
        else
          [0, fret_count]
        end

        valid_strings = string_groups || (0...tuning.open_string_notes.size).to_a

        matrix.each_with_index do |string, string_index|
          next unless valid_strings.include?(string_index)
            
          string.each_with_index do |fret, fret_index|
            next unless fret_index.between?(min_fret, max_fret)

            fret.map! do |n|
              fret_notes = n.split('/')
              if (fret_notes & Array(notes)).any?
                fret_notes.include?(root) ? "(#{n}*)" : "#{n}*"
              else
                n
              end
            end
          end
        end
      end
    end
  end
end
