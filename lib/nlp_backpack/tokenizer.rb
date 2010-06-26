module NLPBackpack
  module Tokenizer
    autoload :Sentence, "nlp_backpack/tokenizers/sentence"
    autoload :Line, "nlp_backpack/tokenizers/line"
    autoload :Custom, "nlp_backpack/tokenizers/custom"
    autoload :Space, "nlp_backpack/tokenizers/space"
    autoload :Tag, "nlp_backpack/tokenizers/tab"
    autoload :Whitespace, "nlp_backpack/tokenizers/whitespace"
    autoload :Word, "nlp_backpack/tokenizers/word"
  end
end