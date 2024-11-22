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

      def altered?
        accidentals.any?
      end

      def alteration_value
        Hash.new(0).tap do |h|
          h['#']  = 1
          h['b']  = -1
          h['##'] = 2
          h['bb'] = -2
        end[name.slice(/#|b|##|bb/)]
      end

      def naturalize
        Util.naturalize name
      end
    end
  end
end
