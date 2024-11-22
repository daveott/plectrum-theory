require 'ostruct'

module Plectrum
  module Theory
    class Interval < OpenStruct
      # HOW TO IMPLEMENT 9, 11, 13?
      INTERVALS = [
        { semitones: 0, interval: 0, name: 'unison', quality: 'perfect' },
        { semitones: 1, interval: 2, name: 'second', quality: 'minor' },
        { semitones: 2, interval: 2, name: 'second', quality: 'major' },
        { semitones: 3, interval: 2, name: 'second', quality: 'augmented' },
        { semitones: 3, interval: 3, name: 'third', quality: 'minor' },
        { semitones: 4, interval: 3, name: 'third', quality: 'major' },
        { semitones: 5, interval: 4, name: 'fourth', quality: 'perfect' },
        { semitones: 6, interval: 4, name: 'fourth', quality: 'augmented' },
        { semitones: 6, interval: 5, name: 'fifth', quality: 'diminished' },
        { semitones: 7, interval: 5, name: 'fifth', quality: 'perfect' },
        { semitones: 8, interval: 6, name: 'sixth', quality: 'minor' },
        { semitones: 9, interval: 6, name: 'sixth', quality: 'major' },
        { semitones: 10, interval: 7, name: 'seventh', quality: 'minor' },
        { semitones: 11, interval: 7, name: 'seventh', quality: 'major' },
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
          interval[:name] == options[:name]
        end)
      end

      def self.between(a, b)
        alphabet = Alphabet.new(Util.naturalize(a))
        distance = alphabet.next_distance(Util.naturalize(b))

        semitones = distance.first

        semitones += SEMITONES.select do |k, _|
          (k - alphabet.steps_to(b).map do |note|
            Util.naturalize(note)
          end).empty?
        end.values.sum + altered_semitones(b) - altered_semitones(a)
        
        find_by(semitones: semitones, name: distance.last)
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
        name == 'unison' && quality == 'perfect'
      end

      def minor_second?
        name == 'second' && quality == 'minor'
      end

      def major_second?
        name == 'second' && quality == 'major'
      end

      def augmented_second?
        name == 'second' && quality == 'augmented'
      end

      def minor_third?
        name == 'third' && quality == 'minor'
      end

      def major_third?
        name == 'third' && quality == 'major'
      end

      def perfect_fourth?
        name == 'fourth' && quality == 'perfect'
      end

      def augmented_fourth?
        name == 'fourth' && quality == 'augmented'
      end

      def diminished_fifth?
        name == 'fifth' && quality == 'diminished'
      end
      alias tritone? diminished_fifth?

      def perfect_fifth?
        name == 'fifth' && quality == 'perfect'
      end

      def minor_sixth?
        name == 'sixth' && quality == 'minor'
      end

      def major_sixth?
        name == 'sixth' && quality == 'major'
      end

      def minor_seventh?
        name == 'seventh' && quality == 'minor'
      end

      def major_seventh?
        name == 'seventh' && quality == 'major'
      end
    end
  end
end
