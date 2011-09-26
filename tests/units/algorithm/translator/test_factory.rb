require_relative '../../../../lib/algorithm/translator/factory'
require 'test/unit'

class TestFactory < Test::Unit::TestCase

  def setup
    super
  end

  def test_should_be_able_to_create_valid_translator
    assert Translator::Factory::create_translator("ruby").instance_of? Translator::Ruby::Ruby
  end

end

