module Plectrum
  module Theory
    module ToneBitmask
      extend self

      def all
        power_set.map(&base)
      end

      def base
        -> (i) { i.to_s(2) }
      end

      def power_set
        (0..4095)
      end

      def find(number)
        unless power_set.include?(number)
          raise ArgumentError, 'Integer is not in range'
        end
        base.call(number)
      end
    end
  end
end
