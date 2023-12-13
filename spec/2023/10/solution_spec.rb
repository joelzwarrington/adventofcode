# frozen_string_literal: true

require "spec_helper"

RSpec.describe Year2023::Day10 do
  describe.skip "part 1" do
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

  describe "part 2" do
    subject { described_class.part_2(input) }

    let(:input) do
      <<~EOF
        ...........
        .S-------7.
        .|F-----7|.
        .||.....||.
        .||.....||.
        .|L-7.F-J|.
        .|..|.|..|.
        .L--J.L--J.
        ...........
      EOF
    end

    it { is_expected.to eq(4) }

    context "with another test input" do
      let(:input) do
        <<~EOF
          ..........
          .S------7.
          .|F----7|.
          .||....||.
          .||....||.
          .|L-7F-J|.
          .|..||..|.
          .L--JL--J.
          ..........
        EOF
      end

      it { is_expected.to eq(4) }
    end

    context "with another input example" do
      let(:input) do
        <<~EOF
          FF7FSF7F7F7F7F7F---7
          L|LJ||||||||||||F--J
          FL-7LJLJ||||||LJL-77
          F--JF--7||LJLJ7F7FJ-
          L---JF-JLJ.||-FJLJJ7
          |F|F-JF---7F7-L7L|7|
          |FFJF7L7F-JF7|JL---7
          7-L-JL7||F7|L7F-7F7|
          L.L7LFJ|||||FJL7||LJ
          L7JLJL-JLJLJL--JLJ.L
        EOF
      end

      it { is_expected.to eq(10) }
    end
  end
end
