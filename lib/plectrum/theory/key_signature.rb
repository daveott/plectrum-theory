module Plectrum
  module Theory
    class KeySignature
      KEY_SIGNATURES = {
        'C'  => { accidentals: [], relative_minor: 'a' },
        'G'  => { accidentals: ['F#'], relative_minor: 'e' },
        'D'  => { accidentals: ['F#', 'C#'], relative_minor: 'b' },
        'A'  => { accidentals: ['F#', 'C#', 'G#'], relative_minor: 'f#' },
        'E'  => { accidentals: ['F#', 'C#', 'G#', 'D#'], relative_minor: 'c#' },
        'B'  => { accidentals: ['F#', 'C#', 'G#', 'D#', 'A#'], relative_minor: 'g#' },
        'F#' => { accidentals: ['F#', 'C#', 'G#', 'D#', 'A#', 'E#'], relative_minor: 'd#' },
        'C#' => { accidentals: ['F#', 'C#', 'G#', 'D#', 'A#', 'E#', 'B#'], relative_minor: nil },
        'F'  => { accidentals: ['Bb'], relative_minor: 'd' },
        'Bb' => { accidentals: ['Bb', 'Eb'], relative_minor: 'g' },
        'Eb' => { accidentals: ['Bb', 'Eb', 'Ab'], relative_minor: 'c' },
        'Ab' => { accidentals: ['Bb', 'Eb', 'Ab', 'Db'], relative_minor: 'f' },
        'Db' => { accidentals: ['Bb', 'Eb', 'Ab', 'Db', 'Gb'], relative_minor: 'bb' },
        'Gb' => { accidentals: ['Bb', 'Eb', 'Ab', 'Db', 'Gb', 'Cb'], relative_minor: 'eb' },
        'Cb' => { accidentals: ['Bb', 'Eb', 'Ab', 'Db', 'Gb', 'Cb', 'Fb'], relative_minor: nil }
      }

      QUALITIES = %w(major minor)

      attr_reader :name, :accidentals, :quality

      def self.find(key, quality='major')
        new(key, quality)
      end

      def self.sample(quality: nil)
        quality = (QUALITIES & Array.wrap(quality)).first || QUALITIES.sample
        name = KEY_SIGNATURES.keys.sample(1).first
        new(name, quality)
      end

      def initialize(name='C', quality='major')
        @name = name
        @quality = quality
      end

      def accidentals
        if quality == 'major'
          KEY_SIGNATURES[name][:accidentals]
        else
          KEY_SIGNATURES[relative_major][:accidentals]
        end
      end

      def sharps?
        accidentals.any? { |a| a.include?('#') }
      end

      def flats?
        accidentals.any? { |a| a.include?('b') }
      end

      def relative_minor
        quality == 'major' ? KEY_SIGNATURES[name][:relative_minor] : name
      end

      def relative_major
        if quality == 'minor'
          KEY_SIGNATURES.find do |k, v|
            v[:relative_minor] == name
          end.first
        else
          name
        end
      end
    end
  end
end
