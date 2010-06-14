module Tokenizer
  class Custom
    class << self
      def tokenize(string, spliter)
        string.split(spliter)
      end
    end
  end
end