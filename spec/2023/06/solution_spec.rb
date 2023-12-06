# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2023::Day06 do
  let(:input) {
    <<~EOF
      Time:      7  15   30
      Distance:  9  40  200
    EOF
  }

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(288) }
  end

  describe "part 2" do
    # it "returns nil for the example input" do
    #   expect(described_class.part_2(example_input)).to eq(nil)
    # end

    # it "returns nil for my input" do
    #   expect(described_class.part_2(input)).to eq(nil)
    # end
  end
end
