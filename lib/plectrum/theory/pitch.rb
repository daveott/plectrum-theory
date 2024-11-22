module Plectrum
  module Theory
    class Pitch
      attr_reader :name, :context

      NAMES = %w(B#/C C#/Db D D#/Eb E E#/F F#/Gb G G#/Ab A A#/Bb B/Cb) * 2

      def initialize(name: 'C', context: nil)
        @name = name
        @context = context
      end

      def enharmonic?
        name.include?('/')
      end

      def enharmonic_of(enharmonic)
        NAMES.find do |name|
          name.include?(enharmonic)
        end.gsub(enharmonic, '').gsub('/','')
      end

      def enharmonics
        name.split('/')
      end

      def naturals_of(values)
        @naturals_of ||= values.map do |value|
          Util.naturalize(value)
        end
      end

      def next(distance=1)
        NAMES[NAMES.index(name) + (distance % 7), 1].last
      end

      def previous(distance=1)
        NAMES[NAMES.index(name) - (distance % 7), 1].last
      end

      def to_s
        resolve_enharmonic(context.spelling.last)
      end

      def resolve_enharmonic(previous)
        enharmonics.find do |pitch|
          if Interval.between(previous, pitch).augmented_second?
            return enharmonic_of(pitch)
          end if context.pentatonic?

          pitch.include?(Alphabet.new(previous,
            enharmonics: naturals_of(enharmonics)
          ).next)
        end
      end
    end
  end
end
