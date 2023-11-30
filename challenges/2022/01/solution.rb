# frozen_string_literal: true

module Year2022
  class Day01 < Solution
    def part_1
      data.map(&:sum).max
    end

    def part_2
      data.map(&:sum).max(3).sum
    end

    private

    def process_input(line)
      return unless line.present?

      line.to_i
    end

    def process_dataset(set)
      set.split
    end
  end
end
