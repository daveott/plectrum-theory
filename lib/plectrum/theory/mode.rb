require 'plectrum/theory/spellable'

module Plectrum
  module Theory
    class Mode
      include Spellable

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

      def self.sample
        tonic = Scale::SCALES.keys.sample
        mode = MODES.keys.sample
        new(tonic, mode)
      end

      def initialize(tonic, name)
        @tonic = tonic
        @name = name
        @spelling = [tonic]
      end

      def bitmask
        @bitmask ||= ToneBitmask.find MODES[name.to_sym][:bitmask]
      end

      def key
        spell[-index_of]
      end

      def index_of(name=nil)
        MODES.find_index { |k, _| k == (name&.to_sym || self.name.to_sym) }
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
