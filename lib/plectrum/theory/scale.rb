module Plectrum
  module Theory
    class Scale
      attr_reader :number, :root, :bitmask

      def initialize(number:, root:, bitmask: 0)
        @number = number
        @root = root
        @bitmask = ToneBitmask.find(number)
      end

      def spell
        bitmask.each do |bit|
          if bit == '1'
            pitch = Pitch.new(step: spelling.last).next
            spelling << pitch unless complete?
          end
        end
        spelling
      end

      def spelling
        @spelling ||= [root]
      end

      def complete?
        spelling.size == (bitmask.length - 1)
      end
    end
  end
end
