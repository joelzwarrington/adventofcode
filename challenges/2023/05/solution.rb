# frozen_string_literal: true

module Year2023
  class Day05 < Solution
    MAPS = [
      "seed-to-soil",
      "soil-to-fertilizer",
      "fertilizer-to-water",
      "water-to-light",
      "light-to-temperature",
      "temperature-to-humidity",
      "humidity-to-location",
    ]

    def maps
      @maps ||= data.from(2).split("").each_with_object({}) do |lines, map|
        map_type = lines.first.match(/[a-z-]+(?= map)/)[0]
        map[map_type] = lines.from(1).map do |line|
          destination_range_start, source_range_start, range_length = line.scan(/\d+/).map(&:to_i)
          [
            [source_range_start, source_range_start + range_length - 1],
            [destination_range_start, destination_range_start + range_length - 1],
          ]
        end
      end
    end

    def seed_to_location(seed)
      current = seed

      MAPS.each do |map_key|
        maps[map_key].each do |ranges|
          if ranges[0][0] <= current && current <= ranges[0][1]
            current = current - ranges[0][0] + ranges[1][0]
            break
          end
        end
      end

      current
    end

    def location_to_seed(location)
      current = location

      MAPS.reverse.each do |map_key|
        maps[map_key].each do |ranges|
          if ranges[1][0] <= current && current <= ranges[1][1]
            current = current - ranges[1][0] + ranges[0][0]
            break
          end
        end
      end

      current
    end

    def part_1
      seeds = data.first.scan(/\d+/).map(&:to_i)
      seeds.map { |seed| seed_to_location(seed) }.min
    end

    def part_2
      seed_ranges = data.first.scan(/\d+\s\d+/).map do |pair|
        start, length = pair.split(/\s/).map(&:to_i)
        [start, start + length]
      end

      (0..).find do |location|
        puts "Location: #{location}" if location % 10_000 == 0

        seed = location_to_seed(location)

        seed_ranges.any? do |ranges|
          ranges[0] <= seed && seed <= ranges[1]
        end
      end
    end
  end
end
