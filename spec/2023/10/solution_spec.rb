# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day10 do
  describe "part 1" do
    subject { described_class.part_1(input) }

    context "with square loop" do
      let(:input) do
        <<~EOF
          .....
          .S-7.
          .|.|.
          .L-J.
          .....
        EOF
      end

      it { is_expected.to eq(4) }
    end

    context "with more complex loop" do
      let(:input) do
        <<~EOF
          ..F7.
          .FJ|.
          SJ.L7
          |F--J
          LJ...
        EOF
      end

      it { is_expected.to eq(8) }
    end
  end

  # describe "part 2" do
  #   subject { described_class.part_2(input) }

  #   it { is_expected.to eq(2) }
  # end
end
