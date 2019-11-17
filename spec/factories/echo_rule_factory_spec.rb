require 'factories/echo_rule_factory'
require 'shared_examples/factory_shared_examples'

describe EchoRuleFactory do
  subject(:factory) { EchoRuleFactory.new }

  it_behaves_like 'factory'

  it 'create echo rule' do
    element = { rule_type: 'EchoRule' }
    expect(factory.create(element: element)).to be_a(EchoRule)
  end
end
