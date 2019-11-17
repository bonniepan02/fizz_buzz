# Loop through to concatenate fizzbuzz results
class Looper
  DELIMETER = ' '.freeze

  def initialize
    @fizz_buzz = FizzBuzz.new
  end

  def run(num)
    result = (1..num).map { |i| @fizz_buzz.get_string(i) }
    result.join(DELIMETER)
  end
end
