module NLPBackpack
  # = Stop Words
  # A basic list of stop words.
  #
  # Example:
  #
  # NLPBackpack::StopWords.all => Array of stop words
  class StopWords
    class << self
      def all
        File.read(stop_word_path).split("\n")
      end

      private

      def stop_word_path
        File.expand_path(File.dirname(__FILE__) + '/stop_words/stop_words.txt')
      end
    end
  end

end