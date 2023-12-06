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
    subject { described_class.part_2(input) }

    it { is_expected.to eq(71503) }
  end
end
