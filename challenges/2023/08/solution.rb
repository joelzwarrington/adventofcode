# frozen_string_literal: true

module Year2023
  class Day08 < Solution
    class Node
      attr_reader :left, :right

      def initialize(left, right)
        @left = left
        @right = right
      end
    end

    def part_1
      directions = data.first.scan(/\w/).map { |direction| direction == "L" ? :left : :right }
      nodes = data.from(2).each_with_object({}) do |line, object|
        id, left, right = line.scan(/\w+/)
        object[id] = Node.new(left, right)
      end

      steps = 0
      found = false
      current_node = nodes["AAA"]

      until found
        direction = directions[steps % directions.size]

        node_id = current_node.public_send(direction)
        steps += 1

        if node_id == "ZZZ"
          found = true
        else
          current_node = nodes[node_id]
        end
      end

      steps
    end

    def part_2
      nil
    end
  end
end
