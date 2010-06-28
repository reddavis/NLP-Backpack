# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nlp_backpack}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["reddavis"]
  s.date = %q{2010-06-28}
  s.description = %q{A backpack full of useful toys}
  s.email = %q{reddavis@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/nlp_backpack.rb",
     "lib/nlp_backpack/chunker.rb",
     "lib/nlp_backpack/chunker/regex_chunker.rb",
     "lib/nlp_backpack/chunker/tag_pattern.rb",
     "lib/nlp_backpack/classifier.rb",
     "lib/nlp_backpack/classifier/base.rb",
     "lib/nlp_backpack/classifier/naive_bayes.rb",
     "lib/nlp_backpack/conditional_frequency_distribution.rb",
     "lib/nlp_backpack/evaluation.rb",
     "lib/nlp_backpack/evaluation/accuracy.rb",
     "lib/nlp_backpack/evaluation/base.rb",
     "lib/nlp_backpack/evaluation/confusion_matrix.rb",
     "lib/nlp_backpack/feature_selection.rb",
     "lib/nlp_backpack/feature_selection/base.rb",
     "lib/nlp_backpack/feature_selection/chi_squared.rb",
     "lib/nlp_backpack/feature_selection/frequency.rb",
     "lib/nlp_backpack/feature_selection/mutual_information.rb",
     "lib/nlp_backpack/lexical_density.rb",
     "lib/nlp_backpack/pos.rb",
     "lib/nlp_backpack/pos/brill_tagger.rb",
     "lib/nlp_backpack/pos/brill_tagger/lexicon.txt",
     "lib/nlp_backpack/pos/pos_array.rb",
     "lib/nlp_backpack/stop_words.rb",
     "lib/nlp_backpack/stop_words/stop_words.txt",
     "lib/nlp_backpack/syllable.rb",
     "lib/nlp_backpack/syllable/flesch_index.rb",
     "lib/nlp_backpack/tokenizer.rb",
     "lib/nlp_backpack/tokenizers/custom.rb",
     "lib/nlp_backpack/tokenizers/line.rb",
     "lib/nlp_backpack/tokenizers/sentence.rb",
     "lib/nlp_backpack/tokenizers/space.rb",
     "lib/nlp_backpack/tokenizers/tab.rb",
     "lib/nlp_backpack/tokenizers/whitespace.rb",
     "lib/nlp_backpack/tokenizers/word.rb",
     "lib/nlp_backpack/type_token_ratio.rb",
     "nlp_backpack.gemspec",
     "spec/chunkers/regex_chunker_spec.rb",
     "spec/chunkers/tag_pattern_spec.rb",
     "spec/classifiers/naive_bayes_spec.rb",
     "spec/conditional_frequency_distribution_spec.rb",
     "spec/evaluation/accuracy_spec.rb",
     "spec/evaluation/confusion_matrix_spec.rb",
     "spec/feature_selection/chi_squared_spec.rb",
     "spec/feature_selection/frequency_spec.rb",
     "spec/feature_selection/mutual_information_spec.rb",
     "spec/lexical_density_spec.rb",
     "spec/nlp_backpack_spec.rb",
     "spec/pos/brill_tagger_spec.rb",
     "spec/pos/pos_array_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/stop_words_spec.rb",
     "spec/syllable/flesch_index_spec.rb",
     "spec/tokenizers/custom_spec.rb",
     "spec/tokenizers/line_spec.rb",
     "spec/tokenizers/sentence_spec.rb",
     "spec/tokenizers/space_spec.rb",
     "spec/tokenizers/tab_spec.rb",
     "spec/tokenizers/whitespace_spec.rb",
     "spec/tokenizers/word_spec.rb",
     "spec/type_token_ratio_spec.rb"
  ]
  s.homepage = %q{http://github.com/reddavis/NLP-Backpack}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A backpack full of useful toys}
  s.test_files = [
    "spec/chunkers/regex_chunker_spec.rb",
     "spec/chunkers/tag_pattern_spec.rb",
     "spec/classifiers/naive_bayes_spec.rb",
     "spec/conditional_frequency_distribution_spec.rb",
     "spec/evaluation/accuracy_spec.rb",
     "spec/evaluation/confusion_matrix_spec.rb",
     "spec/feature_selection/chi_squared_spec.rb",
     "spec/feature_selection/frequency_spec.rb",
     "spec/feature_selection/mutual_information_spec.rb",
     "spec/lexical_density_spec.rb",
     "spec/nlp_backpack_spec.rb",
     "spec/pos/brill_tagger_spec.rb",
     "spec/pos/pos_array_spec.rb",
     "spec/spec_helper.rb",
     "spec/stop_words_spec.rb",
     "spec/syllable/flesch_index_spec.rb",
     "spec/tokenizers/custom_spec.rb",
     "spec/tokenizers/line_spec.rb",
     "spec/tokenizers/sentence_spec.rb",
     "spec/tokenizers/space_spec.rb",
     "spec/tokenizers/tab_spec.rb",
     "spec/tokenizers/whitespace_spec.rb",
     "spec/tokenizers/word_spec.rb",
     "spec/type_token_ratio_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

