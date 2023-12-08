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

  describe "part 2" do
    subject { described_class.part_2(input) }

    let(:input) do
      <<~EOF
        LR

        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
      EOF
    end

    it { is_expected.to eq(6) }
  end
end
