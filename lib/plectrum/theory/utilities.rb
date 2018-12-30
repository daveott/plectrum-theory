module Plectrum
  module Theory
    module Utilities
      extend self

      def strip_accidentals(value)
        value.gsub(/b|#/,'')
      end
    end
  end
end
