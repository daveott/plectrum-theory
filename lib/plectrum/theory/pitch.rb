module Plectrum
  module Theory
    class Pitch
      attr_reader :step, :alter, :octave

      def initialize(step: 'C', alter: 0, octave: 4)
        @step = step
        @alter = alter
        @octave = octave
      end

      def next(distance=1)
        pluck(distance: distance)
      end

      def previous(distance=1)
        pluck(distance: distance, reverse: true)
      end

      private
      def pluck(steps: 'CDEFGABCDEFGABC', distance: 1, reverse: false)
        steps = steps.reverse if reverse
        distance = distance % 7
        steps[steps.index(step) + distance, 1]
      end
    end
  end
end
