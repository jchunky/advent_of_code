module Year2016
  module Day7
    class Problem2 < Problem
      def self.test_input
        "aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb
"
      end

      def self.test_result
        3
      end

      def result
        lines.count(&method(:supports_ssl?))
      end

      def supports_ssl?(ip_address)
        sequences = ip_address.gsub(/\[\w+\]/, ' ').split
        hypernet_sequences = ip_address.scan(/\[(\w+)\]/).flatten
        sequences.any? do |sequence|
          abas(sequence).any? do |aba|
            hypernet_sequences.any? { |hs| has_bab?(aba, hs) }
          end
        end
      end

      def abas(sequence)
        sequence.chars.each_cons(3)
          .select { it == it.reverse && it.uniq.count > 1 }
          .map(&:join)
      end

      def has_bab?(aba, sequence)
        bab = [aba[1], aba[0], aba[1]].join
        sequence.include?(bab)
      end
    end
  end
end
