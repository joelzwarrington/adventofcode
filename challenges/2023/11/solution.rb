# frozen_string_literal: true

module Year2023
  class Day11 < Solution
    def part_1
      universe.distance_of_pairs
    end

    def part_2
      nil
    end

    private

    class Universe
      def initialize(image)
        @image = Matrix[*image]
        @image.each_with_index do |element, row, column|
          galaxies << [row, column] if element == "#"
        end

        @image.row_vectors.each_with_index do |vector, row|
          expanded_rows << row if vector.all? { |tile| tile == "." }
        end

        @image.column_vectors.each_with_index do |vector, column|
          expanded_columns << column if vector.all? { |tile| tile == "." }
        end
      end

      def distance_of_pairs
        galaxies.each_with_object({}) do |a, object|
          object[a] = {}
          galaxies.difference([a]).each do |b|
            next if object[b]&.key?(a)

            object[a][b] = distance(a, b)
          end
        end.values.map(&:values).flatten.sum
      end

      # private

      def distance((a_row, a_column), (b_row, b_column))
        without_expansion = (a_row - b_row).abs + (a_column - b_column).abs

        extra_rows = expanded_rows.count { |row| row.between?(*[a_row, b_row].sort) }
        extra_columns = expanded_columns.count { |column| column.between?(*[a_column, b_column].sort) }

        without_expansion + extra_rows + extra_columns
      end

      # # temp
      # def coordinates_to_galaxy_number(row, column)
      #   case [row, column]
      #   when [0, 3] then 1
      #   when [1, 7] then 2
      #   when [2, 0] then 3
      #   when [4, 6] then 4
      #   when [5, 1] then 5
      #   when [6, 9] then 6
      #   when [8, 7] then 7
      #   when [9, 0] then 8
      #   when [9, 4] then 9
      #   end
      # end

      def galaxies
        @galaxies ||= Set.new
      end

      def expanded_rows
        @expanded_rows ||= Set.new
      end

      def expanded_columns
        @expanded_columns ||= Set.new
      end
    end

    def universe
      @universe ||= Universe.new(
        data.map do |line|
          line.split("")
        end,
      )
    end
  end
end
