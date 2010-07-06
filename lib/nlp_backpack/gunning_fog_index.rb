require 'nlp_backpack/tokenizers/word'
require 'nlp_backpack/tokenizers/sentence'
require 'nlp_backpack/syllable/flesch_index'

module NLPBackpack
  # = Gunning Fog Index
  # Example:
  #
  # text = "the cat sat on the mat"
  # gfi = NLPBackpack::GunningFogIndex.new(text)
  # gfi.process => the answer
  class GunningFogIndex
    def initialize(text)
      @text = text
    end

    # Return the GFI
    def process
      0.4 * ( (word_count / sentence_count) + 100 * (complex_word_count / word_count) )
    end

    # The average sentence length of the inputted text
    def average_sentence_length
      word_count / sentence_count
    end

    # Overall word count
    def word_count
      @word_count ||= tokenized_words.size.to_f
    end

    # Overall sentence count
    def sentence_count
      @sentence_count ||= Tokenizer::Sentence.tokenize(@text).size.to_f
    end

    # Overall complex word count (words >= 3 syllables)
    def complex_word_count
      @complex_word_count ||= Syllable::FleschIndex.new(*tokenized_words).process.delete_if {|word, s_count| s_count < 3}.size.to_f
    end

    private

    def tokenized_words
      @tokenized_words ||= Tokenizer::Word.tokenize(@text)
    end
  end

end