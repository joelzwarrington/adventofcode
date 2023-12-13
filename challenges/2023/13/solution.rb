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
      patterns.sum do |pattern|
        first_horizontal_mirror_index = horizontal(pattern, 1, 1)
        first_vertical_mirror_index = vertical(pattern, 1, 1)

        second_horizontal_mirror_index = horizontal(pattern, 1, 1, ignore: first_horizontal_mirror_index, has_smudges: true)
        second_vertical_mirror_index = vertical(pattern, 1, 1, ignore: first_vertical_mirror_index, has_smudges: true)

        next second_horizontal_mirror_index * 100 if second_horizontal_mirror_index

        second_vertical_mirror_index
      end
    end

    private

    def horizontal(pattern, index, size, ignore: nil, has_smudges: false)
      rows = pattern.row_vectors
      up = rows[(index - size)...index]
      down = rows[index...(size + index)].reverse

      sum_of_differences = (0...size).reduce(0) do |total_sum, vector_index|
        differences = up[vector_index].each_with_index.sum do |a, index|
          b = down[vector_index][index]

          a == b ? 0 : 1
        end

        total_sum + differences
      end

      if index != ignore && (up == down || (sum_of_differences == 1 && has_smudges))
        # this means we cant expand anymore, and it's already mirrored
        if index - size <= 0 || index + size > rows.size - 1
          index
        else
          # expand size by 1 and check if that's mirrored
          horizontal(pattern, index, size + 1, ignore:, has_smudges:)
        end
      # current index isnt mirrored so increase it and reset size
      elsif index < rows.size - 1
        horizontal(pattern, index + 1, 1, ignore:, has_smudges:)
      end
    end

    def vertical(pattern, index, size, ignore: nil, has_smudges: false)
      columns = pattern.column_vectors
      left = columns[(index - size)...index]
      right = columns[index...(size + index)].reverse

      sum_of_differences = (0...size).reduce(0) do |total_sum, vector_index|
        differences = left[vector_index].each_with_index.sum do |a, index|
          b = right[vector_index][index]

          a == b ? 0 : 1
        end

        total_sum + differences
      end

      if index != ignore && (left == right || (sum_of_differences == 1 && has_smudges))
        # this means we cant expand anymore, and it's already mirrored
        if index - size <= 0 || index + size > columns.size - 1
          index
        else
          # expand size by 1 and check if that's mirrored
          vertical(pattern, index, size + 1, ignore:, has_smudges:)
        end
      # current index isnt mirrored so increase it and reset size
      elsif index < columns.size - 1
        vertical(pattern, index + 1, 1, ignore:, has_smudges:)
      end
    end

    def patterns
      @patterns ||= data.split("").map do |pattern|
        Matrix[*pattern.map { |line| line.split("") }]
      end
    end
  end
end
