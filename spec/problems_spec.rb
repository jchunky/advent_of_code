require "active_support/all"
require "digest"
require "prime"

Dir.chdir("spec")
Dir["../lib/utils/*.rb"].each { |file| require_relative(file) }
Dir["../lib/**/*.rb"].each { |file| require_relative(file) }

RSpec.configure do |config|
  # config.profile_examples = true
end

def get_result
  yield
rescue ResultException => ex
  ex.value
end

def class_of(problem_path)
  year, day, problem = problem_path.split(/\W/)[4, 3]
  "Year#{year}::#{day.capitalize}::#{problem.capitalize}".constantize
end

def input_file_of(problem_path)
  "#{problem_path[0, problem_path.rindex("/")]}/input.txt"
end

describe "problems" do
  problems = Dir["../lib/**/problem?.rb"]
  problems.each do |problem|
    clazz = class_of(problem)
    it "#{clazz} is solved" do
      input =
        if clazz.respond_to?(:test_input)
          clazz.test_input
        else
          input_file = input_file_of(problem)
          File.read(input_file)
        end
      result = get_result { clazz.new(input).result }
      expect(result).to eq(clazz.test_result)
    end
  end
end
