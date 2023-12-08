# frozen_string_literal: true

module Year2023
  class Day08 < Solution
    class Node
      attr_accessor :id

      def initialize(network, id, left_id, right_id)
        @network = network
        @id = id
        @left_id = left_id
        @right_id = right_id
      end

      def left
        @network.nodes[@left_id]
      end

      def right
        @network.nodes[@right_id]
      end

      def inspect
        "<Node id=\"#{id}\">"
      end
    end

    class Network
      attr_accessor :nodes

      def initialize(nodes = nil)
        @nodes = nodes
      end
    end

    def network
      @network ||= begin
        network = Network.new

        nodes = data.from(2).each_with_object({}) do |line, object|
          id, left, right = line.scan(/\w+/)
          object[id] = Node.new(network, id, left, right)
        end

        network.nodes = nodes
        network
      end
    end

    def directions
      @directions ||= data.first.scan(/\w/).map { |direction| direction == "L" ? :left : :right }
    end

    def direction_given_step(step)
      directions[(step - 1) % directions.size]
    end

    def part_1
      node = network.nodes["AAA"]

      (1..).find do |step|
        node = node.send(direction_given_step(step))
        node.id == "ZZZ"
      end
    end

    def part_2
      nodes = network.nodes.values.filter { |node| node.id.ends_with?("A") }

      nodes.reduce(0) do |total_steps, node|
        steps = (1..).find do |step|
          node = node.send(direction_given_step(step))
          node.id.ends_with?("Z")
        end

        if total_steps.zero?
          steps
        else
          total_steps.lcm(steps)
        end
      end
    end
  end
end
