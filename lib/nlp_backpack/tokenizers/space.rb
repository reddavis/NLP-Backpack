module NLPBackpack

  module Tokenizer
    class Space
      class << self
        def tokenize(string)
          string.split(/\s{1}/)
        end
      end
    end
  end

end