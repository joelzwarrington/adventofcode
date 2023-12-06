# frozen_string_literal: true
module Year2023
  class Day06 < Solution
    def part_1
      times = data.first.scan(/\d+/).map(&:to_i)
      distances = data.second.scan(/\d+/).map(&:to_i)
      number_of_races = times.size

      (0...number_of_races).reduce(0) do |total, race|
        time = times[race]
        distance_to_beat = distances[race]

        leftmost = 0.upto(time).find do |seconds_holding_button|
          distance = seconds_holding_button * (time - seconds_holding_button)
          distance > distance_to_beat
        end

        rightmost = time.downto(0).find do |seconds_holding_button|
          distance = seconds_holding_button * (time - seconds_holding_button)
          distance > distance_to_beat
        end

        chances_to_win = rightmost - leftmost + 1

        if total.zero?
          chances_to_win
        else
          total * chances_to_win
        end
      end
    end

    def part_2
      nil
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
