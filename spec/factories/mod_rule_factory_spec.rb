require 'factories/mod_rule_factory'
require 'shared_examples/factory_shared_examples'

describe ModRuleFactory do
  subject(:factory) { ModRuleFactory.new }

  it_behaves_like 'factory'

  it 'create mod rule' do
    element = { modulus: '3', ouput: 'fizz' }
    expect(factory.create(element: element)).to be_a(ModRule)
  end
end
