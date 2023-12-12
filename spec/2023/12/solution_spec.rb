# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day12 do
  let(:input) do
    <<~EOF
      ???.### 1,1,3
      .??..??...?##. 1,1,3
      ?#?#?#?#?#?#?#? 1,3,1,6
      ????.#...#... 4,1,1
      ????.######..#####. 1,6,5
      ?###???????? 3,2,1
    EOF
  end

  describe "part 1" do
    subject { described_class.part_1(input) }

    it { is_expected.to eq(21) }
  end

  describe "part 2" do
    subject { described_class.part_2(input) }

    it { is_expected.to eq(nil) }
  end
end
