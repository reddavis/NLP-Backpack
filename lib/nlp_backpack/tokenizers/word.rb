module NLPBackpack

  module Tokenizer
    class Word
      class << self
        def tokenize(string)
          string.split(/\W*\s/)
        end
      end
    end
  end

end