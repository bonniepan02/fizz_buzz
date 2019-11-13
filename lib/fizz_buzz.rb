# For the numbers 1 to 100, print each number using the following rules:
# If the number is
#    evenly divisible by 3, print 'fizz'
#    evenly divisible by 5, print 'buzz'
#    evenly divisible by 15, print 'fizzbuzz'
#    evenly divisible by 7, print 'bang'
#    evenly divisible by 21, print 'fizzbang'
#    evenly divisible by 35, print 'buzzbang'
# Otherwise print the number.
# FizzBuzzer rule
class FizzBuzz
  def initialize
    @rules = [ModRule.new(3, 'fizz'),
              ModRule.new(5, 'buzz'),
              ModRule.new(7, 'bang')]
  end

  def get_string(num)
    result = ''
    @rules.each do |rule|
      result << rule.handle(num)
    end
    result.empty? ? num.to_s : result
  end
end

class ModRule
  def initialize(num, output)
    @num = num
    @output = output
  end

  def handle(input)
    (input % @num).zero? ? @output : ''
  end
end
