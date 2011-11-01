require '../../configuration'
require '../base'
Dir[File.dirname(__FILE__) + '/actions/*.rb'].each {|file| require file }

module Algorithm
  module Translator
    module Ruby
      class Ruby < Translator::Base

        include Translator::Ruby::Actions

        def type_of type_to_search
          Configuration.instance["language"]["ruby"]["casts"].select {|type, method| type == type_to_search}.first
        end

        def variables_recorded
          @variables ||= {}
        end
      end
    end
  end
end

