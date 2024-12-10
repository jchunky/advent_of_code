require "active_support/all"
require "digest"

Dir.chdir("spec")
Dir["../lib/utils/*.rb"].each { |file| require_relative(file) }
Dir["../lib/**/*.rb"].each { |file| require_relative(file) }

describe "problems" do
  it "are solved"  do
    problems = Dir["../lib/**/problem?.rb"]
    problems.each do |problem|
      p problem
      clazz = class_of(problem)
      input_file = input_file_of(problem)
      input = File.read(input_file)
      p get_result { clazz.new(input).result }
    end
  end

  def get_result
    yield
  rescue ResultException => ex
    ex.value
  end

  def class_of(problem_path)
    year, day, problem =  problem_path.split(/\W/)[4, 3]
    clazz = "Year#{year}::#{day.capitalize}::#{problem.capitalize}".constantize
    clazz
  end

  def input_file_of(problem_path)
    year, day, problem =  problem_path.split(/\W/)[4, 3]
    input_file = problem_path[0, problem_path.rindex("/")] + "/input.txt"
  end
end