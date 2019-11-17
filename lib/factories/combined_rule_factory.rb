require 'rules/combined_rule'

class CombinedRuleFactory
  def initialize(mapper)
    @mapper = mapper
  end

  def create(element: nil)
    rules_elements = element[:rules]
    rules = rules_elements.map do |inner_element|
      factory = @mapper.rule_factory_by(inner_element[:rule_type])
      factory.create(element: inner_element)
    end
    CombinedRule.new(rules)
  end
end
