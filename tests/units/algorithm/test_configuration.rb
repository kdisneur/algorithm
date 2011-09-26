require_relative '../../../lib/algorithm/configuration'
require 'test/unit'

class TestConfiguration < Test::Unit::TestCase

  Configuration::Default_configuration_file = File.dirname(__FILE__) + "/../../files/conf/algorithms.yml"

  def setup
    super
  end

  def test_should_be_able_to_get_output_language
    assert Configuration.instance["output_language"] == "ruby"
  end

  def test_should_be_able_to_get_key_words
    assert Configuration.instance["key_words"].instance_of? Hash
    assert Configuration.instance["key_words"].first[0] == "algo"
  end

end

