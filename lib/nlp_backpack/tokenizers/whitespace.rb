module NLPBackpack

  module Tokenizer
    class Whitespace
      class << self
        def tokenize(string)
          string.split
        end
      end
    end
  end

end