# frozen_string_literal: true

module Year2023
  class Day08 < Solution
    class Node
      attr_reader :id, :left, :right

      def initialize(id, left, right)
        @id = id
        @left = left
        @right = right
      end
    end

    def part_1
      directions = data.first.scan(/\w/).map { |direction| direction == "L" ? :left : :right }
      nodes = data.from(2).each_with_object({}) do |line, object|
        id, left, right = line.scan(/\w+/)
        object[id] = Node.new(id, left, right)
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
      directions = data.first.scan(/\w/).map { |direction| direction == "L" ? :left : :right }
      nodes_map = data.from(2).each_with_object({}) do |line, object|
        id, left, right = line.scan(/\w+/)
        object[id] = Node.new(id, left, right)
      end

      nodes = nodes_map.values.filter_map { |node| node if node.id.ends_with?("A") }
      steps_per_node = Array.new(nodes.size, 0)

      nodes.each_with_index do |node, index|
        steps = 0
        found = false
        current_node = node

        until found
          direction = directions[steps % directions.size]
          node_id = current_node.public_send(direction)

          steps += 1
          if node_id.ends_with?("Z")
            found = true
          else
            current_node = nodes_map[node_id]
          end
        end

        steps_per_node[index] = steps
      end

      steps_per_node.reduce(&:lcm)
    end
  end
end
