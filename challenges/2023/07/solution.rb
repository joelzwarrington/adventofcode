# frozen_string_literal: true

module Year2023
  class Day07 < Solution
    class Hand
      include Comparable

      attr_reader :cards

      def initialize(cards)
        @cards = cards.map { |card| card_to_rank(card) }
      end

      def <=>(other)
        [
          tally,
          cards,
        ] <=> [
          other.tally,
          other.cards,
        ]
      end

      def tally
        cards.tally.values.sort.last(2).reverse
      end

      private

      def card_to_rank(card)
        {
          "A" => 14,
          "K" => 13,
          "Q" => 12,
          "J" => 11,
          "T" => 10,
          "9" => 9,
          "8" => 8,
          "7" => 7,
          "6" => 6,
          "5" => 5,
          "4" => 4,
          "3" => 3,
          "2" => 2,
        }[card]
      end
    end

    class JokerHand < Hand
      def tally
        return super unless joker?

        number_of_jokers = cards.tally[1]

        return [5] if number_of_jokers == 5

        without_jokers = cards.filter { |card| card != 1 }.tally.values.sort.last(2).reverse

        without_jokers[0] = without_jokers[0] + number_of_jokers
        without_jokers
      end

      private

      def card_to_rank(card)
        {
          "A" => 13,
          "K" => 12,
          "Q" => 11,
          "T" => 10,
          "9" => 9,
          "8" => 8,
          "7" => 7,
          "6" => 6,
          "5" => 5,
          "4" => 4,
          "3" => 3,
          "2" => 2,
          "J" => 1,
        }[card]
      end

      def joker?
        cards.include? 1
      end
    end

    def part_1
      hands = data.map do |line|
        hand = Hand.new(line.match(/[AKQJT\d]+(?=\s)/)[0].split(""))
        score = line.match(/(?<=\s)\d+/)[0].to_i

        [hand, score]
      end.sort { |a, b| a.first <=> b.first }

      hands.each_with_index.sum do |(_hand, score), index|
        score * (index + 1)
      end
    end

    def part_2
      hands = data.map do |line|
        hand = JokerHand.new(line.match(/[AKQJT\d]+(?=\s)/)[0].split(""))
        score = line.match(/(?<=\s)\d+/)[0].to_i

        [hand, score]
      end.sort { |a, b| a.first <=> b.first }

      hands.each_with_index.sum do |(_hand, score), index|
        score * (index + 1)
      end
    end
  end
end
