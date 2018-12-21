module Plectrum
  module Theory
    module BinaryScale
      extend self

      def all
        range.map(&base)
      end

      def range
        (0..4095)
      end

      def base
        -> (i) { i.to_s(2) }
      end

      def find(number)
        unless range.include?(number)
          raise ArgumentError, 'Integer is not in range'
        end
        number.to_s(2)
      end
    end
  end
end
