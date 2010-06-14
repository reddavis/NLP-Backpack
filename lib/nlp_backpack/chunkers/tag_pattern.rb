module Chunker
  class TagPattern

    attr_reader :tag, :conditions

    def initialize(pattern)
      extract_tag_and_options(pattern)
    end

    private

    # TODO Make this work for strings wrapped in " " as well as ' '
    def extract_tag_and_options(pattern)
      if match = pattern.match(/\(([^\)]+)\)/)
        @tag = /#{match[1]}/
      end

      if match = pattern.match(/\([^\)]+\)(.)/)
        @conditions = match[1]
      end
    end

  end
end