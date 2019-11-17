require 'rules/first_match_rule'
require 'shared_examples/rule_shared_examples'
require 'rules/echo_rule'
require 'rules/mod_rule'

describe FirstMatchRule do
  subject(:rule) do
    mod_rule = ModRule.new(modulus: 3, output: 'fizz')
    echo_rule = EchoRule.new
    FirstMatchRule.new([mod_rule, echo_rule])
  end

  it_behaves_like 'rule'

  it 'should return the result of the first match rule' do
    expect(rule.get_string(num: 1)).to eql('1')
    expect(rule.get_string(num: 3)).to eql('fizz')
    expect(rule.get_string(num: nil)).to eql(nil)
  end
end
