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
    composite_rule = CompositeRule.new(
      [ModRule.new(3, 'fizz'),
       ModRule.new(5, 'buzz'),
       ModRule.new(7, 'bang')]
    )
    @rule = FirstMatchRule.new(
      [
        composite_rule,
        EchoRule.new
      ]
    )
  end

  def get_string(num)
    @rule.get_string(num)
  end
end

# IRule

class ModRule
  def initialize(num, output)
    @num = num
    @output = output
  end

  def get_string(num)
    (num % @num).zero? ? @output : nil
  end
end

class EchoRule
  def get_string(num)
    num.to_s
  end
end

class FirstMatchRule
  def initialize(rules)
    @rules = rules
  end

  def get_string(num)
    @rules.each do |rule|
      matched = rule.get_string(num)
      return matched if matched
    end
    nil
  end
end

class CompositeRule
  def initialize(rules)
    @rules = rules
  end

  def get_string(num)
    result = ''
    @rules.each do |rule|
      matched = rule.get_string(num)
      result += matched if matched
    end
    result.empty? ? nil : result
  end
end
