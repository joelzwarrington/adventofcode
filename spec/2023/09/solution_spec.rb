# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day09 do
  let(:input) do
    <<~EOF
      0 3 6 9 12 15
      1 3 6 10 15 21
      10 13 16 21 30 45
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(114) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    it { is_expected.to eq(2) }
  end
end
