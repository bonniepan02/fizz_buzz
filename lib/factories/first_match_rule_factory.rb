require 'rules/first_match_rule'

class FirstMatchRuleFactory
  def initialize(mapper)
    @mapper = mapper
  end

  def create(element: nil)
    rules_elements = element[:rules]
    rules = rules_elements.map do |inner_element|
      rule_type = inner_element[:rule_type]
      factory = @mapper.rule_factory_by(rule_type)

      factory.create(element: inner_element)
    end
    FirstMatchRule.new(rules)
  end
end
