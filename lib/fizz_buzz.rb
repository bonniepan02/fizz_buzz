# fizzbuzz rules
class FizzBuzz
  def initilize
    mapper = RuleFactoryMapper.new
    parser = RuleParser.new(mapper)
    @rule = parser.rule
  end

  def get_string(num)
    @rule.get_string(num)
  end
end
