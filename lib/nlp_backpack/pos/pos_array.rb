# A POSArray holds the words and pos tags for a sentence

module POS
  class InvalidSentence < Exception; end;

  class POSArray < Array

    def <<(values)
      validate_sentence(values)
      super
    end

    def append(word, pos)
      self << [word, pos]
    end

    # Turn into word/pos
    def to_s
      map {|word| word.join("/") }.join(" ")
    end

    private

    def validate_sentence(value)
      raise InvalidSentence("Adding words needs to be structured like: [word, pos]") unless value.size == 2
    end
  end
end