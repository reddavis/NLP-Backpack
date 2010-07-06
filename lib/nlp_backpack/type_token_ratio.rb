require 'nlp_backpack/tokenizers/word'

module NLPBackpack
  # = Type Token Ratio
  # Number of unique words / number of words * 100
  # Example:
  #
  # text = "hello there"
  # TypeTokenRatio.analyze(text) => result
  class TypeTokenRatio
    class << self
      def analyze(text)
        new(text).process
      end
    end

    def initialize(text)
      @text = prepare_text(text)
    end

    def process
      (unique_words / total_words) * 100
    end

    private

    def unique_words
      @unique_words ||= @text.uniq.size.to_f
    end

    def total_words
      @text.size.to_f
    end

    def prepare_text(text)
      Tokenizer::Word.tokenize(text)
    end
  end

end