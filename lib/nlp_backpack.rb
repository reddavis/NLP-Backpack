$:.unshift File.expand_path(File.dirname(__FILE__))

module NLPBackpack
  autoload :FrequencyDistribution, "nlp_backpack/frequency_distribution"
  autoload :Evaluation, "nlp_backpack/evaluation"
  autoload :Classifier, "nlp_backpack/classifier"
  autoload :StopWords, "nlp_backpack/stop_words"
  autoload :Chunker, "nlp_backpack/chunker"
  autoload :POS, "nlp_backpack/pos"
end