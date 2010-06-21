module NLPBackpack
  module FeatureSelection
    autoload :MutualInformation, "nlp_backpack/feature_selection/mutual_information"
    autoload :Frequency, "nlp_backpack/feature_selection/frequency"
    autoload :ChiSquared, "nlp_backpack/feature_selection/chi_squared"
  end
end