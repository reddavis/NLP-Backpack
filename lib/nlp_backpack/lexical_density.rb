require 'nlp_backpack/tokenizers/word'

module NLPBackpack

  # number of lexical tokens / number of all token * 100
  class LexicalDensity
    class << self
      def analyze(text)
        new(text).result
      end
    end

    def initialize(text)
      @text = prepare_text(text)
    end

    def result
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
      Tokenizer::Custom.tokenize(text)
    end
  end

end