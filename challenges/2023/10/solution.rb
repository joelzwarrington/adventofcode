# frozen_string_literal: true

module Year2023
  class Day10 < Solution
    class Tile
      attr_reader :x, :y, :tile

      def initialize(x, y, tile)
        @x = x
        @y = y
        @tile = tile
      end

      CONNECTIONS = {
        east: ['S', '-', 'L', 'F'],
        west: ['S', '-', 'J', '7'],
        north: ['S', '|', 'L', 'J'],
        south: ['S', '|', '7', 'F'],
      }

      def connected?(adjacent_pipe)
        from, to = directions(adjacent_pipe)
        return true if from.present? && to.present? && [tile, adjacent_pipe.tile].any?(:starting?)

        if from.nil? || to.nil?
          puts "\n\n"
          puts [self, adjacent_pipe].inspect if from.nil? || to.nil?
          puts "\n\n"
        end

        tile.in?(CONNECTIONS[from]) && adjacent_pipe.tile.in?(CONNECTIONS[to])
      end

      def next_pipe_from(previous_pipe = nil, matrix:)
        if previous_pipe.present?
          adjacent_pipes(matrix: matrix).find do |adjacent_pipe|
            adjacent_pipe.connected?(self) && [previous_pipe.x, previous_pipe.y] != [adjacent_pipe.x, adjacent_pipe.y]
          end
        else
          adjacent_pipes(matrix: matrix).filter { |adjacent_pipe| adjacent_pipe.connected?(self) }
        end
      end

      def starting?
        tile == "S"
      end

      private

      def adjacent_pipes(matrix:)
        [
          [x - 1, y],
          [x, y - 1],
          [x + 1, y],
          [x, y + 1],
        ]
          .filter { |x, y| x.between?(0, matrix.column_size - 1) && y.between?(0, matrix.row_size - 1) }
          .map { |x, y| matrix[y, x] }
      end

      def directions(adjacent_pipe)
        case [x - adjacent_pipe.x, y - adjacent_pipe.y]
        when [-1, 0] then [:east, :west]
        when [1, 0] then [:west, :east]
        when [0, 1] then [:north, :south]
        when [0, -1] then [:south, :north]
        end
      end
    end

    class Pipeline
      attr_reader :matrix

      def initialize(matrix)
        @matrix = Matrix[*matrix]
      end

      def starting_position
        matrix[*matrix.index(&:starting?)]
      end

      def furthest_tile_from_starting_position
        @furthest_tile_from_starting_position ||= begin
          visited = {}

          pipes = starting_position.next_pipe_from(matrix: matrix).map { |pipe| [pipe, starting_position] }

          (1..).find do
            pipes = pipes.map do |pipe, previous_pipe|
              visited[[previous_pipe.x, previous_pipe.y]] = true

              [pipe.next_pipe_from(previous_pipe, matrix: matrix), pipe]
            end

            pipes.any? { |pipe, _previous_pipe| visited.key?([pipe.x, pipe.y]) }
          end
        end
      end

      # def adjacent_pipes
      #   start_x, start_y = matrix.index("S")

      #   adjacent_tiles = [
      #     [start_x - 1, start_y],
      #     [start_x, start_y - 1],
      #     [start_x + 1, start_y],
      #     [start_x, start_y + 1],
      #   ].filter { |x, y| x.between?(0, matrix.column_size - 1) && y.between?(0, matrix.row_size - 1) }

      #   adjacent_tiles.filter_map do |x, y|
      #     Pipe.new(x, y, matrix[x, y])
      #   end
      # end
    end

    def pipeline
      @pipeline ||= Pipeline.new(
        data.each_with_index.map do |line, y|
          line.split("").each_with_index.map do |tile, x|
            Tile.new(x, y, tile)
          end
        end,
      )
    end

    def part_1
      pipeline.furthest_tile_from_starting_position
    end

    def part_2
      nil
    end
  end
end
