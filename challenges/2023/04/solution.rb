# frozen_string_literal: true

module Year2023
  class Day04 < Solution
    def part_1
      data.sum do |card|
        winning_numbers, numbers = card.from(8).split("|").map { |chars| chars.scan(/\d+/) }

        number_of_matches = (winning_numbers & numbers).size

        if number_of_matches == 0
          0
        else
          1 * (2**(number_of_matches - 1))
        end
      end
    end

    def part_2
      @memo = {}

      data.sum do |card|
        process_card(card)
      end
    end

    def process_card(card)
      card_number = card.match(/\d+(?=:)/)[0].to_i
      winning_numbers, numbers = card.from(8).split("|").map { |chars| chars.scan(/\d+/) }
      number_of_matches = (winning_numbers & numbers).size

      @memo[card_number] ||= begin
        cards_to_add = data[card_number...(card_number + number_of_matches)]

        @memo[card_number] = 1 + cards_to_add.sum { |card| process_card(card) }
      end
    end
  end
end
