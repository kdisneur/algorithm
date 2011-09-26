require 'singleton'
require 'yaml'

class Configuration
  include Singleton

  Default_configuration_file = "conf/algorithms.yml"

  def initialize
    file = Configuration::Default_configuration_file
    puts "valeur: #{file}"
    @configuration = YAML::load File.open(file)
  end

  def method_missing name, *args
    @configuration["algorithms"].send name, *args
  end
end

