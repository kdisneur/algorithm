module Translator
  module Ruby
    module Actions
      def display key_word, line
        line.gsub! key_word.matcher, key_word.replacement
        line.gsub! /"\s\+\s([^\+]+)/i, "\" + (\\1).to_s"
        @output.write "puts #{line}"
      end
    end
  end
end

