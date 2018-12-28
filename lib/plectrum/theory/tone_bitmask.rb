module Plectrum
  module Theory
    class ToneBitmask
      def self.all
        power_set.map(&base).map do |bitmask|
          new(bitmask)
        end
      end

      def self.base
        -> (i) { i.to_s(2) }
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
    end
  end
end
