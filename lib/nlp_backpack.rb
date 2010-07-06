$:.unshift File.expand_path(File.dirname(__FILE__))

module NLPBackpack
  autoload :ConditionalFrequencyDistribution, "nlp_backpack/conditional_frequency_distribution"
  autoload :StopWords, "nlp_backpack/stop_words"
  autoload :LexicalDensity, "nlp_backpack/lexical_density"
  autoload :GunningFogIndex, "nlp_backpack/gunning_fog_index"
  autoload :TypeTokenRatio, "nlp_backpack/type_token_ratio"

  # Errors
  autoload :Error, "nlp_backpack/error"

  module Chunker
    autoload :RegexChunker, "nlp_backpack/chunkers/regex_chunker"
  end

  module Classifier
    autoload :NaiveBayes, "nlp_backpack/classifiers/naive_bayes"
  end

  module Evaluation
    autoload :Accuracy, "nlp_backpack/evaluations/accuracy"
    autoload :ConfusionMatrix, "nlp_backpack/evaluations/confusion_matrix"
  end

  module FeatureSelection
    autoload :MutualInformation, "nlp_backpack/feature_selections/mutual_information"
    autoload :Frequency, "nlp_backpack/feature_selections/frequency"
    autoload :ChiSquared, "nlp_backpack/feature_selections/chi_squared"
  end

  module POS
    autoload :BrillTagger, "nlp_backpack/pos/brill_tagger"
  end

  module Tokenizer
    autoload :Sentence, "nlp_backpack/tokenizers/sentence"
    autoload :Line, "nlp_backpack/tokenizers/line"
    autoload :Custom, "nlp_backpack/tokenizers/custom"
    autoload :Space, "nlp_backpack/tokenizers/space"
    autoload :Tag, "nlp_backpack/tokenizers/tab"
    autoload :Whitespace, "nlp_backpack/tokenizers/whitespace"
    autoload :Word, "nlp_backpack/tokenizers/word"
  end

  module Syllable
    autoload :FleschIndex, "nlp_backpack/syllable/flesch_index"
  end
end