# frozen_string_literal: true

module Year2023
  class Day02 < Solution
    def part_1
      data.reduce(0) do |total, line|
        round = line.scan(/(?<=Game )\d+/).first

        blue = line.scan(/\d+(?= blue)/).map(&:to_i).max
        red = line.scan(/\d+(?= red)/).map(&:to_i).max
        green = line.scan(/\d+(?= green)/).map(&:to_i).max

        impossible = blue > 14 || red > 12 || green > 13

        unless impossible
          total += round.to_i
        end

        total
      end
    end

    def part_2
      data.reduce(0) do |total, line|
        blue = line.scan(/\d+(?= blue)/).map(&:to_i).max
        red = line.scan(/\d+(?= red)/).map(&:to_i).max
        green = line.scan(/\d+(?= green)/).map(&:to_i).max

        total += blue * red * green

        total
      end
    end
  end
end
