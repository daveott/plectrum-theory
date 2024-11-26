class GuitarTuning
  attr_reader :tuning

  def initialize(tuning)
    @tuning = tuning
  end

  def open_string_notes
    case tuning
    when :standard
      %w(E A D G B/Cb E)
    end
  end

  def string_numbers
    (0...open_string_notes.size).to_a
  end
end
