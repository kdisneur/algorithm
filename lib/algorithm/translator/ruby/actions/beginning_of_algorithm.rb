module Algorithm
  module Translator
    module Ruby
      module Actions
        def beginning_of_algorithm key_word, line
          line.gsub! key_word.matcher, key_word.replacement
          @output.write "puts \"programme: #{line}\n----------\n\n\""
        end
      end
    end
  end
end

