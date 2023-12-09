# frozen_string_literal: true

module Year2023
  class Day09 < Solution
    class Sequence
      attr_reader :numbers, :child

      def initialize(numbers)
        @numbers = numbers
        unless numbers.all?(&:zero?) || numbers.size == 1
          @child = Sequence.new(
            (0...(numbers.size - 1)).map { |index| numbers[index + 1] - numbers[index] },
          )
        end
      end

      def next_value
        if @child.present?
          @numbers.last + @child.next_value
        else
          0
        end
      end
    end

    def part_1
      sequences = data.map { |line| Sequence.new(line.scan(/-?\d+/).map(&:to_i)) }
      sequences.sum(&:next_value)
    end

    def part_2
      nil
    end
  end
end
