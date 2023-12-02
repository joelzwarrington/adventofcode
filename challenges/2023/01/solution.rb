# frozen_string_literal: true

module Year2023
  class Day01 < Solution
    def part_1
      data.sum do |line|
        digits = line.scan(/\d/)
        [digits.first, digits.last].join.to_i
      end
    end

    NUMBERS = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
    }.freeze

    def part_2
      data.sum do |line|
        digits = line.scan(
          /(?=(\d|one|two|three|four|five|six|seven|eight|nine))/,
        ).flatten.map do |digit|
          NUMBERS[digit] || digit.to_i
        end

        [digits.first, digits.last].join.to_i
      end
    end
  end
end
