# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day08 do
  let(:input) do
    <<~EOF
      RL

      AAA = (BBB, CCC)
      BBB = (DDD, EEE)
      CCC = (ZZZ, GGG)
      DDD = (DDD, DDD)
      EEE = (EEE, EEE)
      GGG = (GGG, GGG)
      ZZZ = (ZZZ, ZZZ)
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(2) }
  end

  # describe "part 2" do
  #   subject { described_class.part_2(input) }

  #   it.skip { is_expected.to eq(1) }
  # end
end
