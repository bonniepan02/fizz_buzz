require 'rules/mod_rule'
require 'shared_examples/rule_shared_examples'

describe ModRule do
  let(:rule) { ModRule.new(modulus: 3, output: 'fizz') }
  it_behaves_like 'rule'

  it 'should return the output string if num is divisible by modulus' do
    expect(rule.get_string(num: 3)).to eql('fizz')
  end

  it 'should return nil if num is not divisible by num' do
    expect(rule.get_string(num: 4)).to eql(nil)
  end
end
