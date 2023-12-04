# frozen_string_literal: true

module Year2023
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      symbols = {}
      parts = {}

      data.each_with_index do |line, row|
        # find all parts
        line.enum_for(:scan, /\d+/).each do
          match = Regexp.last_match

          start_column = match.begin 0
          end_column = match.end 0

          parts[
            [
              row,
              [start_column, end_column],
            ]
          ] = match[0]
        end

        # find all symbols
        line.enum_for(:scan, /[^a-zA-Z0-9_.]/).each do
          match = Regexp.last_match

          column = match.begin 0

          symbols[
            [
              row,
              column,
            ]
          ] = match[0]
        end
      end

      parts.sum do |position, part_number|
        row = position.first
        column_start, column_end = position.last

        is_machine_part = false

        ((row - 1)..(row + 1)).each do |row|
          is_adjacent_to_symbol = false

          ((column_start - 1)..column_end).each do |column|
            is_adjacent_to_symbol = symbols.key? [row, column]

            next unless is_adjacent_to_symbol

            is_machine_part = true
            # puts [part_number, [row, column]].inspect
            break
          end

          break if is_adjacent_to_symbol
        end

        if is_machine_part
          part_number.to_i
        else
          0
        end
      end
    end

    def part_2
      symbols = {}
      parts = {}

      data.each_with_index do |line, row|
        # find all parts
        line.enum_for(:scan, /\d+/).each do
          match = Regexp.last_match

          start_column = match.begin 0
          end_column = match.end 0

          parts[
            [
              row,
              [start_column, end_column],
            ]
          ] = match[0]
        end

        # find all symbols
        line.enum_for(:scan, /[^a-zA-Z0-9_.]/).each do
          match = Regexp.last_match

          column = match.begin 0

          symbols[
            [
              row,
              column,
            ]
          ] = match[0]
        end
      end

      symbols.sum do |(row, column), symbol|
        next 0 unless symbol == "*"

        adjacent_part_keys = parts.keys.filter do |part_row, (column_start, column_end)|
          on_adjacent_row = part_row - 1 == row || part_row == row || part_row + 1 == row
          on_adhacent_column = column.between?(column_start - 1, column_end)

          on_adjacent_row && on_adhacent_column
        end

        next 0 unless adjacent_part_keys.size == 2

        parts[adjacent_part_keys.first].to_i * parts[adjacent_part_keys.last].to_i
      end
    end
  end
end
