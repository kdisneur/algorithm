#! /usr/bin/env ruby

ENV['PATH'] = "#{ENV['PATH']}:#{File.join(File.dirname(__FILE__), '..')}"

require './lib/algorithm/algorithm'

if __FILE__ == $0
  file = ARGV.first
  algorithm = Algorithm::Algorithm.new file
  algorithm.run
end

