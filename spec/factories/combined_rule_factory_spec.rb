require 'factories/combined_rule_factory'
require 'shared_examples/factory_shared_examples'
require 'rule_factory_mapper'

describe CombinedRuleFactory do
  let(:mapper) { RuleFactoryMapper.new }

  subject(:factory) { CombinedRuleFactory.new(mapper) }

  it_behaves_like 'factory'

  it 'create combined rule' do
    element = { rules: [{ rule_type: 'ModRule', modulus: 3, output: 'fizz' },
                        { rule_type: 'ModRule', modulus: 5, output: 'buzz' },
                        { rule_type: 'ModRule', modulus: 7, output: 'bang' }],
                rule_type: 'CombinedRule' }
    expect(factory.create(element: element)).to be_a(CombinedRule)
  end
end
