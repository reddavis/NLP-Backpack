require 'nlp_backpack/tokenizers/word'
require 'nlp_backpack/pos/brill_tagger'

module NLPBackpack

  # number of lexical tokens / number of all token * 100
  class LexicalDensity
    class << self
      def analyze(text)
        new(text).result
      end
    end

    def initialize(text)
      count_tokens(text)
    end

    def result
      (@lexical_tokens / @total_words) * 100
    end

    private

    # TODO: When we have multiple POS, make this customizable
    def count_tokens(text)
      @total_words = Tokenizer::Word.tokenize(text).size.to_f

      @lexical_tokens = 0.0
      Tokenizer::Sentence.tokenize(text).each do |sentence|
        pos = POS::BrillTagger.analyze(sentence)

        @lexical_tokens += pos.delete_if {|x| x[1].match(/^[^N|^V|^R|^J]/)}.size
      end
    end
  end

end