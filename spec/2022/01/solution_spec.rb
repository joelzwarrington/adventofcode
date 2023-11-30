# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2022::Day01) do
  let(:input) do
    <<~EOF
      1

      2
      2

      3
      3
      3

      4
      4
      4
      4

      5
      5
      5
      5
      5
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(25) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    it { is_expected.to eq(50) }
  end
end
