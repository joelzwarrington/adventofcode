# frozen_string_literal: true
module Year2023
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |card|
        winning_numbers, numbers = card.from(8).split("|").map { |chars| chars.scan(/\d+/) }

        number_of_matches = (winning_numbers & numbers).size

        result = if number_of_matches == 0
          0
        else
          1 * (2**(number_of_matches - 1))
        end

        result
      end
    end

    def part_2
      cards_to_process = data.dup
      total_scratchcards = 0

      while cards_to_process.present?
        total_scratchcards += 1

        card = cards_to_process.shift
        card_number = card.match(/\d+(?=:)/)[0].to_i

        winning_numbers, numbers = card.from(8).split("|").map { |chars| chars.scan(/\d+/) }
        number_of_matches = (winning_numbers & numbers).size

        next if number_of_matches == 0

        cards_to_add = data[card_number...(card_number + number_of_matches)]

        cards_to_process.push(*cards_to_add)
      end

      total_scratchcards
    end
  end
end
