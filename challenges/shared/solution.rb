# frozen_string_literal: true

require "active_support"
require "active_support/all"

class Solution
  class << self
    def part_1(*input)
      new(*input).part_1
    end

    def part_2(*input)
      new(*input).part_2
    end
  end

  def initialize(input)
    @input = input
  end

  def data
    @data ||= begin
      processed = @input.lines(chomp: true).map do |line|
        process_input(line)
      end

      processed.length == 1 ? processed.first : process_dataset(processed)
    end
  end

  private

  def process_input(line)
    line
  end

  def process_dataset(set)
    set
  end
end
