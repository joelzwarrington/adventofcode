# frozen_string_literal: true

module Year2023
  class Day11 < Solution
    def part_1
      universe.distance_of_pairs
    end

    def part_2(expansion_multiplier: 1000000)
      universe.distance_of_pairs(expansion_multiplier: expansion_multiplier)
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

      def distance_of_pairs(expansion_multiplier: 2)
        galaxies.each_with_object({}) do |a, object|
          object[a] = {}
          galaxies.difference([a]).each do |b|
            next if object[b]&.key?(a)

            object[a][b] = distance(a, b, expansion_multiplier - 1)
          end
        end.values.map(&:values).flatten.sum
      end

      private

      def distance((a_row, a_column), (b_row, b_column), expansion_multiplier)
        without_expansion = (a_row - b_row).abs + (a_column - b_column).abs

        extra_rows = expanded_rows.count { |row| row.between?(*[a_row, b_row].sort) } * expansion_multiplier
        extra_columns = expanded_columns.count { |column| column.between?(*[a_column, b_column].sort) } * expansion_multiplier

        without_expansion + extra_rows + extra_columns
      end

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
