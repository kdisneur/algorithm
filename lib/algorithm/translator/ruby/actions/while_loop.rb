module Algorithm
  module Translator
    module Ruby
      module Actions
        def while_loop key_word, line
          line.gsub! key_word.matcher, key_word.replacement
          @output.write "while #{line} do"
          while @input.next_line? do
            line = @input.next_line
            key_word = search_key_word_by_name "end_while"
            break if not key_word.nil? and line.match key_word.matcher
            process_line line
          end
          @output.write "end"
        end
      end
    end
  end
end

