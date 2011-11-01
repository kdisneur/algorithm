#! /usr/bin/env ruby

require_relative '../lib/algorithm/algorithm'

if __FILE__ == $0
  file = ARGV.first
  algorithm = Algorithm::Algorithm.new file
  algorithm.run
end

