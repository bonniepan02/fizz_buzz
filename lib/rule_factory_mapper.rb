require 'factories/mod_rule_factory'
require 'factories/echo_rule_factory'
require 'factories/combined_rule_factory'
require 'factories/first_match_rule_factory'

class RuleFactoryMapper
  def initialize
    @type_to_factory =
      {
        'ModRule' => ModRuleFactory.new,
        'EchoRule' => EchoRuleFactory.new
      }
    @type_to_factory['CombinedRule'] = CombinedRuleFactory.new(self)
    @type_to_factory['FirstMatchRule'] = FirstMatchRuleFactory.new(self)
  end

  def rule_factory_by(rule_type)
    @type_to_factory[rule_type]
  end
end
