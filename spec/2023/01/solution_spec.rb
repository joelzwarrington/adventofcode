# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day01 do
  let(:input) do
    <<~EOF
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(142) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    let(:input) do
      <<~EOF
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      EOF
    end

    it { is_expected.to eq(281) }
  end
end
