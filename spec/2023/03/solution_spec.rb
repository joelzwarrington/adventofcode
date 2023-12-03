# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day03 do
  describe "part 1" do
    subject { described_class.part_1(input) }

    let(:input) do
      <<~EOF
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      EOF
    end

    it { is_expected.to eq(4361) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    let(:input) do
      <<~EOF
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      EOF
    end

    it { is_expected.to eq(467835) }
  end
end
