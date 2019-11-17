require 'rules/mod_rule'

class ModRuleFactory
  def create(element:)
    modulus = element[:modulus]
    output = element[:output]
    ModRule.new(modulus: modulus, output: output)
  end
end
