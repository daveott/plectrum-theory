module Plectrum
  module Theory
    module BinaryScale
      extend self

      def all
        range.map(&base)
      end

      def base
        -> (i) { i.to_s(2) }
      end

      def range
        (0..4095)
      end

      def find(number)
        unless range.include?(number)
          raise ArgumentError, 'Integer is not in range'
        end
        base.call(number)
      end
    end
  end
end
