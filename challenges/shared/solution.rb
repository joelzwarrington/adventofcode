# frozen_string_literal: true

require "active_support"
require "active_support/all"
require "matrix"
require "memery"
require "set"

class Solution
  include Memery

  class << self
    def part_1(*input, **kwargs)
      new(*input).part_1(**kwargs)
    end

    def part_2(*input, **kwargs)
      new(*input).part_2(**kwargs)
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
