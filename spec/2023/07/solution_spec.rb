# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day07 do
  let(:input) do
    <<~EOF
      32T3K 765
      T55J5 684
      KK677 28
      KTJJT 220
      QQQJA 483
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(6440) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    it { is_expected.to eq(5905) }
  end
end
