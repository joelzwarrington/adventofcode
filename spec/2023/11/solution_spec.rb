# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day11 do
  let(:input) do
    <<~EOF
      ...#......
      .......#..
      #.........
      ..........
      ......#...
      .#........
      .........#
      ..........
      .......#..
      #...#.....
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(374) }
  end

  describe "part 2" do
    subject { described_class.part_2(input, expansion_multiplier: expansion_multiplier) }

    context "when multiplier is 10" do
      let(:expansion_multiplier) { 10 }

      it { is_expected.to eq(1030) }
    end

    context "when multiplier is 100" do
      let(:expansion_multiplier) { 100 }

      it { is_expected.to eq(8410) }
    end
  end
end
