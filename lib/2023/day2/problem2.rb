module Year2023
  module Day2
    class Problem2 < Problem
      def self.test_inputx
        "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"
      end

      def self.test_result
        2286
      end

      def result
        lines.sum do |line|
          game, draws = line.split(":")
          game = game.split.last.to_i

          counts = Hash.new(0)
          draws.split(";").each do |draw|
            draw.split(",").each do |color_sample|
              count, color = color_sample.strip.split
              count = count.to_i
              counts[color] = [counts[color], count].max
            end
          end

          counts["red"] * counts["green"] * counts["blue"]
        end
      end
    end
  end
end
