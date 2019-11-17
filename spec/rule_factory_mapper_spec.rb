require 'rule_factory_mapper'

describe RuleFactoryMapper do
  context '#rule_factory_by' do
    it 'returns rule factory by rule type' do
      expect(subject.rule_factory_by('ModRule')).to be_a(ModRuleFactory)
      expect(subject.rule_factory_by('EchoRule')).to be_a(EchoRuleFactory)
      expect(subject.rule_factory_by('CombinedRule')).to be_a(CombinedRuleFactory)
      expect(subject.rule_factory_by('FirstMatchRule')).to be_a(FirstMatchRuleFactory)
    end
  end
end
