module Plectrum
  module Theory
    class ToneBitmask
      COMMON_TONE_BITMASKS = {
        661 => 'major pentatonic',
        1193 => 'minor pentatonic',
        1257 => 'blues',
        2741 => 'ionian',
        1709 => 'dorian',
        1451 => 'phrygian',
        2773 => 'lydian',
        1717 => 'mixolydian',
        1453 => 'aeolian',
        1387 => 'locrian',
        2477 => 'harmonic minor',
        2733 => 'melodic minor',
      }

      UNCOMMON_TONE_BITMASKS = {
        1365 => 'whole tone',
        2925 => 'diminished',
        1371 => 'superlocrian',
        1389 => 'minor locrian',
        1397 => 'major locrian',
        1459 => 'phrygian dominant',
        1493 => 'lydian minor',
        2485 => 'harmonic major',
      }
      def self.all
        power_set.map(&base).map do |bitmask|
          new(bitmask)
        end
      end

      def self.base
        -> (i) { i.to_s(2).rjust(12, '0') }
      end

      def self.power_set
        (0..4095)
      end

      def self.find(number)
        unless power_set.include?(number)
          raise ArgumentError, 'Integer is not in range'
        end
        new(base.call(number))
      end

      def self.sample
        new(COMMON_TONE_BITMASKS.to_a.sample(1).first.first)
      end

      attr_reader :bitmask

      def initialize(bitmask)
        @bitmask = bitmask
      end

      def each(&block)
        bitmask.each_char { |x| yield(x) }
      end

      def length
        bitmask.count("1").size
      end

      def to_a
        bitmask.split('')
      end

      def to_i
        to_a.map(&:to_i).reverse
      end
    end
  end
end
