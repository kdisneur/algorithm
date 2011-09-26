require_relative '../../../../lib/algorithm/core_ext/string'
require 'test/unit'

class TestString < Test::Unit::TestCase
  def test_should_be_able_to_camelize_string
    assert "camel".camelize == "Camel"
  end

  def test_should_be_able_to_camelize_string_in_place
    camel_string = "camel"
    camel_string.camelize!
    assert camel_string == "Camel"
  end

  def test_should_be_able_to_constantize_a_string
    constant_string = "TestString"
    assert constant_string.constantize == TestString
  end

end

