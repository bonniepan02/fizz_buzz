# fizzbuzz rules
class FizzBuzz
  def initialize(repository)
    @rule_repository = repository
  end

  def run_rule(num)
    rule = @rule_repository.rule
    rule.get_string(num: num)
  end
end
