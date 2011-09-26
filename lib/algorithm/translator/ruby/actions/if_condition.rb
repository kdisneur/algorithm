module Translator
  module Ruby
    module Actions
      def if_condition key_word, line
        line.gsub! key_word.matcher, key_word.replacement
        @output.write "if #{line}"
        while @input.next_line? do
          line = @input.next_line
          key_word = search_key_word_by_name "end_if"
          break if not key_word.nil? and line.match key_word.matcher
          key_word = search_key_word_by_name "else_if"
          if not key_word.nil? and line.match key_word.matcher
            @output.write "else"
            line.gsub! key_word.matcher, key_word.replacement
            line.strip!
          end
          process_line line
        end
        @output.write "end"
      end
    end
  end
end

