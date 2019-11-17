require 'rules/echo_rule'
require 'shared_examples/rule_shared_examples'

describe EchoRule do
  subject(:rule) { EchoRule.new }

  it_behaves_like 'rule'

  it 'should return the number string same value as input' do
    expect(rule.get_string(num: 1)).to eql('1')
  end
end
