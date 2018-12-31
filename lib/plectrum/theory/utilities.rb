module Plectrum
  module Theory
    module Util
      extend self

      def strip_accidentals(value)
        value.gsub(/b|#/,'')
      end

      alias_method :naturalize, :strip_accidentals
    end
  end
end
