module Year2017
  module Day4
    class Problem1 < Problem
      def self.test_input
        "vxjtwn vjnxtw sxibvv mmws wjvtxn icawnd rprh
fhaa qwy vqbq gsswej lxr yzl wakcige mwjrl
bhnlow huqa gtbjc gvj wrkyr jgvmhj bgs umo ikbpdto
drczdf bglmf gsx flcf ojpj kzrwrho owbkl dgrnv bggjevc
ndncqdl lncaugj mfa lncaugj skt pkssyen rsb npjzf
kdd itdyhe pvljizn cgi
jgy pyhuq eecb phwkyl oeftyu pyhuq hecxgti tpadffm jgy
zvc qdk mlmyj kybbh lgbb fvfzcer frmaxa yzgw podt dbycoii afj
zfr msn mns leqem frz
golnm ltizhd dvwv xrizqhd omegnez nan yqajse lgef
"
      end

      def self.test_result
        8
      end

      def result
        lines.count { |l| valid?(l) }
      end

      def valid?(pass_phrase)
        words = pass_phrase.chomp.split
        words.count == words.uniq.count
      end
    end
  end
end
