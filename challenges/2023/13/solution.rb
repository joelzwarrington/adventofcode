# frozen_string_literal: true

require "pry-byebug"

module Year2023
  class Day13 < Solution
    def part_1
      patterns.sum do |pattern|
        horizontal_mirror_index = horizontal(pattern, 1, 1)
        next horizontal_mirror_index * 100 if horizontal_mirror_index

        vertical_mirror_index = vertical(pattern, 1, 1)
        vertical_mirror_index
      end
    end

    def part_2
      nil
    end

    private

    def horizontal(pattern, index, size)
      rows = pattern.row_vectors
      up = rows[(index - size)...index]
      down = rows[index...(size + index)].reverse

      if up == down
        # this means we cant expand anymore, and it's already mirrored
        if index - size <= 0 || index + size > rows.size - 1
          index
        else
          # expand size by 1 and check if that's mirrored
          horizontal(pattern, index, size + 1)
        end
      # current index isnt mirrored so increase it and reset size
      elsif index < rows.size - 1
        horizontal(pattern, index + 1, 1)
      end
    end

    def vertical(pattern, index, size)
      columns = pattern.column_vectors
      left = columns[(index - size)...index]
      right = columns[index...(size + index)].reverse

      if left == right
        # this means we cant expand anymore, and it's already mirrored
        if index - size <= 0 || index + size > columns.size - 1
          index
        else
          # expand size by 1 and check if that's mirrored
          vertical(pattern, index, size + 1)
        end
      # current index isnt mirrored so increase it and reset size
      elsif index < columns.size - 1
        vertical(pattern, index + 1, 1)
      end
    end

    def patterns
      @patterns ||= data.split("").map do |pattern|
        Matrix[*pattern.map { |line| line.split("") }]
      end
    end
  end
end
