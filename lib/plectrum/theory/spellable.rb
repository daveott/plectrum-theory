module Plectrum
  module Theory
    module Spellable
      def chromatic_pitches
        pitches = Pitch::NAMES[Pitch::NAMES.index do |t|
          t.split('/').include?(tonic)
        end, 12]
      end

      def spell
        return chromatic_pitches if chromatic?

        to_a.drop(1).map.with_object(spelling) do |degree, spelling|
          spelling << Pitch.new(name: degree, context: self).to_s
        end
      end

      def type
        ScaleType.find(to_a.size)
      end

      def chromatic?
        type.chromatic?
      end

      def heptatonic?
        type.heptatonic?
      end

      def hexatonic?
        type.hexatonic?
      end

      def octatonic?
        type.octatonic?
      end

      def pentatonic?
        type.pentatonic?
      end

      def to_a
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_pitches.zip(bitmask.to_a.reverse)]
      end
    end
  end
end
