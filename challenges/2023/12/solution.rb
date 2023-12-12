# frozen_string_literal: true

module Year2023
  class Day12 < Solution
    def part_1
      data.sum do |line|
        sequence = line.match(/[?|.|#]+/)[0]
        groups = line.scan(/\d+/).map(&:to_i)
        arrangements(sequence, groups)
      end
    end

    def part_2
      data.sum do |line|
        sequence = Array.new(5, line.match(/[?|.|#]+/)).join("?")
        groups = line.scan(/\d+/).map(&:to_i) * 5
        arrangements(sequence, groups)
      end
    end

    private

    memoize def arrangements(sequence, groups)
      case sequence.first
      when "."
        arrangements(sequence.gsub(/^\.+|\.+$/, ""), groups)
      when "?"
        arrangements(sequence.sub("?", "."), groups) + arrangements(sequence.sub("?", "#"), groups)
      when "#"
        return 0 if groups.empty?
        return 0 if sequence.size < groups.first
        return 0 if (0...groups.first).any? { |i| sequence[i] == "." }

        if groups.size > 1
          return 0 if sequence.size < (groups.first + 1) || sequence[groups.first] == "#"

          arrangements(sequence[(groups.first + 1)..], groups.drop(1))
        else
          arrangements(sequence[groups.first..], groups.drop(1))
        end
      else
        if groups.empty?
          1
        else
          0
        end
      end
    end
  end
end
