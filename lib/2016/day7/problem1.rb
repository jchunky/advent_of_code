module Year2016
  module Day7
    class Problem1 < Problem
      def self.test_input
        "abba[mnop]qrst
abcd[bddb]xyyx
aaaa[qwer]tyui
ioxxoj[asdfgh]zxcvbn
"
      end

      def self.test_result
        2
      end

      def result
        lines.count(&method(:supports_tls?))
      end

      def supports_tls?(ip_address)
        sequences = ip_address.gsub(/\[\w+\]/, ' ').split
        hypernet_sequences = ip_address.scan(/\[(\w+)\]/).flatten
        sequences.any?(&method(:has_abba?)) && hypernet_sequences.none?(&method(:has_abba?))
      end

      def has_abba?(sequence)
        sequence.chars.each_cons(4).any? { it == it.reverse && it.uniq.count > 1 }
      end
    end
  end
end
