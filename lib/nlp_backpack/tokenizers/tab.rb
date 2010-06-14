module Tokenizer
  class Tab
    class << self
      def tokenize(string)
        string.split(/\t{1}/)
      end
    end
  end
end