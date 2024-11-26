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

      def highlight_notes(notes=[], **options)
        return matrix if notes.empty?

        string_groups = options[:string_groups] || tuning.string_numbers

        matrix.each_with_index do |string, string_index|
          next unless string_groups.include?(string_index)

          string.each_with_index do |fret, fret_index|
            next unless fret_index.between?(*fret_range(options[:position]))

            fret.map! &with_annotations(notes, root: options[:root])
          end
        end
      end

      private
      def with_annotations(notes, root: nil)
        -> (fret) {
          fret_notes = fret.split('/')

          if (fret_notes & Array(notes)).any?
            fret_notes.include?(root) ? "(#{fret}*)" : "#{fret}*"
          else
            fret
          end
        }
      end

      def fret_range(position)
        if position.is_a?(Range)
          [position.begin, position.end] 
        else
          [0, fret_count]
        end
      end
    end
  end
end
