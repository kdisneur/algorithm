module Translator
  module Ruby
    module Actions
      def assignment key_word, line
        line.gsub! key_word.matcher, key_word.replacement
        @output.write line
      end
    end
  end
end

