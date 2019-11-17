require 'rules/echo_rule'

class EchoRuleFactory
  def create(element: nil)
    EchoRule.new
  end
end
