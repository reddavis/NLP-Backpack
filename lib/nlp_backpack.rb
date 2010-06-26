$:.unshift File.expand_path(File.dirname(__FILE__))

module NLPBackpack
  autoload :ConditionalFrequencyDistribution, "nlp_backpack/conditional_frequency_distribution"
  autoload :Evaluation, "nlp_backpack/evaluation"
  autoload :Classifier, "nlp_backpack/classifier"
  autoload :StopWords, "nlp_backpack/stop_words"
  autoload :Chunker, "nlp_backpack/chunker"
  autoload :POS, "nlp_backpack/pos"
  autoload :FeatureSelection, "nlp_backpack/feature_selection"
  autoload :TypeTokenRatio, "nlp_backpack/type_token_ratio"
  autoload :Tokenizer, "nlp_backpack/tokenizer"
end