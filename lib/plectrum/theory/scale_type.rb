
module Plectrum
  module Theory
    class ScaleType < OpenStruct
      TYPES = {
        5 => 'pentatonic',
        6 => 'hexatonic',
        7 => 'heptatonic',
        8 => 'octatonic',
        12 => 'chromatic'
      }

      def self.find(num_tones)
        new(name: TYPES[num_tones])
      end

      def chromatic?
        name == 'chromatic'
      end

      def heptatonic?
        name == 'heptatonic'
      end

      def hexatonic?
        name == 'hexatonic'
      end

      def octatonic?
        name == 'octatonic'
      end

      def pentatonic?
        name == 'pentatonic'
      end
    end
  end
end
