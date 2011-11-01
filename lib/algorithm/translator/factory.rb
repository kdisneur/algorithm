require_relative '../core_ext/string'

module Algorithm
  module Translator
    module Factory
      def self.create_translator language_name
        require_relative "./#{language_name}/#{language_name}"
        language_name.camelize!
        @translator = "Algorithm::Translator::#{language_name}::#{language_name}".constantize.new
      end
    end
  end
end

