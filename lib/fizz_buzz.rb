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
    path = File.expand_path('../test.json', __dir__)
    input = File.read(path)
    value = JSON.parse(input, symbolize_names: true).first
    factory = FactoryMapper.new.get(value)
    rule = factory.create(value)

    rule.get_string(num)
  end
end

class FactoryMapper
  def initialize
    @type_to_factory = {}
    @type_to_factory[:ModRule] = ModRuleFactory.new
    @type_to_factory[:EchoRule] = EchoRuleFactory.new
    @type_to_factory[:CompositeRule] = CompositeRuleFactory.new(@type_to_factory)
    @type_to_factory[:FirstMatchRule] = FirstMatchRuleFactory.new(@type_to_factory)
  end

  def get(element)
    rule = element[:rule_type].to_sym
    @type_to_factory[rule]
  end
end

# IFactory
class FirstMatchRuleFactory
  def initialize(type_to_factory)
    @type_to_factory = type_to_factory
  end

  def create(element)
    element_rules = element[:rules]
    rules = element_rules.map do |rule|
      rule_type = rule[:rule_type].to_sym
      @type_to_factory[rule_type].create(rule)
    end

    FirstMatchRule.new(rules)
  end
end

class CompositeRuleFactory
  def initialize(type_to_factory)
    @type_to_factory = type_to_factory
  end

  def create(element)
    element_rules = element[:rules]
    rules = element_rules.map do |rule|
      rule_type = rule[:rule_type].to_sym
      @type_to_factory[rule_type].create(rule)
    end

    CompositeRule.new(rules)
  end
end


class ModRuleFactory
  def create(element)
    ModRule.new(element[:modulus], element[:output])
  end
end
class EchoRuleFactory
  def create(_element)
    EchoRule.new
  end
end

# IParser
class JsonParser
  def initialize(factory)
    @factory = factory
  end

  def rules
    input = File.read('test.json')
    value = Json.parse(input)
    @factory.create(value)
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
