require 'ostruct'

module Plectrum
  module Theory
    class Interval < OpenStruct
      INTERVALS = [
        { semitones: 0, number: 'unison', quality: 'perfect' },
        { semitones: 1, number: 'second', quality: 'minor' },
        { semitones: 2, number: 'second', quality: 'major' },
        { semitones: 3, number: 'second', quality: 'augmented' },
        { semitones: 3, number: 'third', quality: 'minor' },
        { semitones: 4, number: 'third', quality: 'major' },
        { semitones: 5, number: 'fourth', quality: 'perfect' },
        { semitones: 6, number: nil, quality: nil },
        { semitones: 7, number: 'fifth', quality: 'perfect' },
        { semitones: 8, number: 'sixth', quality: 'minor' },
        { semitones: 9, number: 'sixth', quality: 'major' },
        { semitones: 10, number: 'seventh', quality: 'minor' },
        { semitones: 11, number: 'seventh', quality: 'major' },
        { semitones: 12, number: 'octave', quality: 'perfect' },
      ]

      SEMITONES = Hash.new(0).tap do |h|
        h[['B','C']] = -1
        h[['E','F']] = -1
      end

      def self.all
        INTERVALS.map(&method(:new))
      end

      def self.find_by(options)
        new(INTERVALS.find do |interval|
          interval[:semitones] == options[:semitones] &&
          interval[:number] == options[:number]
        end)
      end

      def self.between(a, b)
        distance = Alphabet.new(a).next_distance(Util.naturalize(b))
        semitones = distance.first
        semitones += SEMITONES[[
          Util.naturalize(a),
          Util.naturalize(b)
        ]] + altered_semitones(b) - altered_semitones(a)
        find_by(semitones: semitones, number: distance.last)
      end

      def self.altered_semitones(note)
        Hash.new(0).tap do |h|
          h['#']  = 1
          h['b']  = -1
          h['##'] = 2
          h['bb'] = -2
        end[note.slice(/#|b|##|bb/)]
      end

      def unison?
        number == 'unison' && quality == 'perfect'
      end

      def minor_second?
        number == 'second' && quality == 'minor'
      end

      def major_second?
        number == 'second' && quality == 'major'
      end

      def augmented_second?
        number == 'second' && quality == 'augmented'
      end

      def minor_third?
        number == 'third' && quality == 'minor'
      end
    end
  end
end
