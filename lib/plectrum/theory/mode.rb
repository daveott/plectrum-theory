module Plectrum
  module Theory
    class Mode
      attr_reader :key, :name, :tonic, :bitmask, :spelling

      MODES = {
        ionian: { bitmask: 2741, quality: 'major' },
        dorian: { bitmask: 1709, quality: 'minor' },
        phrygian: { bitmask: 1451, quality: 'minor' },
        lydian: { bitmask: 2773, quality: 'major' },
        mixolydian: { bitmask: 1717, quality: 'dominant' },
        aeolian: { bitmask: 1453, quality: 'minor' },
        locrian: { bitmask: 1387, quality: 'diminished' },
      }

      def initialize(tonic, name)
        @tonic = tonic
        @name = name
        @spelling = [tonic]
      end

      def bitmask
        @bitmask ||= ToneBitmask.find MODES[name.to_sym][:bitmask]
      end

      def chromatic_pitches
        pitches = Pitch::NAMES[Pitch::NAMES.index do |t|
          t.split('/').include?(tonic)
        end, 12]
      end

      def key
        spell[-index_of]
      end

      def index_of(name=nil)
        MODES.find_index { |k, _| k == (name&.to_sym || self.name.to_sym) }
      end

      def spell
        to_a.drop(1).map.with_object(spelling) do |degree, spelling|
          spelling << Pitch.new(name: degree, context: self).to_s
        end
      end

      def to_a
        to_h.map { |key, _| key if to_h[key] == '1' }.compact
      end

      def to_h
        Hash[chromatic_pitches.zip(bitmask.to_a.reverse)]
      end

      def quality
        MODES[name.to_sym][:quality]
      end

      def pentatonic?
        false
      end
    end
  end
end
