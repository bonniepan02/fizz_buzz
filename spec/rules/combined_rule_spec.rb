require 'rules/combined_rule'
require 'shared_examples/rule_shared_examples'
require 'rules/mod_rule'
require 'rules/echo_rule'

describe CombinedRule do
  subject(:rule) do
    CombinedRule.new(
      [ModRule.new(modulus: 4, output: 'I am 4'),
       EchoRule.new]
    )
  end

  it_behaves_like 'rule'

  it 'should return the results of the rules matched' do
    expect(rule.get_string(num: 1)).to eql('1')
  end

  it 'should return the results of all the matched rules combined' do
    expect(rule.get_string(num: 4)).to eql('I am 44')
  end
end
