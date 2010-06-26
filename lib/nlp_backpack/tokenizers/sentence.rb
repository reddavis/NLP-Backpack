require 'nlp_backpack/tokenizers/custom'

module NLPBackpack

  module Tokenizer
    class Sentence < Custom
      class << self
        def tokenize(string)
          super(string, ".")
        end
      end
    end
  end

end