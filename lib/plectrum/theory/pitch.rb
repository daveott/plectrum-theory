module Plectrum
  module Theory
    class Pitch
      attr_reader :step, :alter, :octave

      STEPS = %w(C C#/Db D D#/Eb E E#/F F#/Gb G G#/Ab A A#/Bb B/Cb) * 2

      def initialize(step: 'C', alter: 0, octave: 4)
        @step = step
        @alter = alter
        @octave = octave
      end

      def next(distance=1)
        STEPS[STEPS.index(step) + (distance % 7), 1].last
      end

      def previous(distance=1)
        STEPS[STEPS.index(step) - (distance % 7), 1].last
      end
    end
  end
end
