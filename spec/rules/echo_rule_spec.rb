require 'rules/echo_rule'
require 'shared_examples/rule_shared_examples'

describe EchoRule do
  it_behaves_like 'rule'

  it 'should return the number string same value as input' do
    expect(subject.get_string(num: 1)).to eql('1')
  end
end
