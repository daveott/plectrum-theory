module Plectrum
  module Theory
    class Note
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def accidentals
        name.scan(/[b#]/).join
      end

      def naturalize
        Util.naturalize name
      end
    end
  end
end
