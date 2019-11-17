require 'factories/first_match_rule_factory'
require 'shared_examples/factory_shared_examples'
require 'rule_factory_mapper'
require 'json'

describe FirstMatchRuleFactory do
  let(:mapper) { RuleFactoryMapper.new }
  subject(:factory) { FirstMatchRuleFactory.new(mapper) }

  it_behaves_like 'factory'

  it 'create first match rule' do
    element = { rules: [{ rules: [{ rule_type: 'ModRule', modulus: 3, output:                                 'fizz' },
                                  { rule_type: 'ModRule', modulus: 5, output: 'buzz' },
                                  { rule_type: 'ModRule', modulus: 7, output: 'bang' }],
                          rule_type: 'CombinedRule' },
                        { rule_type: 'EchoRule' }],
                rule_type: 'FirstMatchRule' }
    expect(factory.create(element: element)).to be_a(FirstMatchRule)
  end
end
