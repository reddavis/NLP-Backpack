module NLPBackpack

  module Tokenizer
    class Line
      class << self
        def tokenize(string)
          string.split(/\n{1}/)
        end
      end
    end
  end

end