require_relative '../../../../lib/algorithm/translator/factory'
require 'test/unit'

class TestFactory < Test::Unit::TestCase

  def setup
    super
  end

  def test_should_be_able_to_create_valid_translator
    assert Algorithm::Translator::Factory::create_translator("ruby").instance_of? Algorithm::Translator::Ruby::Ruby
  end

end

