require 'rule_config_parser'
require 'rule_factory_mapper'
require 'rules/echo_rule'
require 'json'

describe RuleConfigParser do
  let(:mapper) { double('RuleFactoryMapper') }
  let(:factory) { double('ModRuleFactory') }

  before do
    allow(mapper).to receive(:rule_factory_by).and_return(factory)
    allow(factory).to receive(:create).and_return(EchoRule.new)
  end

  subject(:parser) { RuleConfigParser.new(mapper) }

  context '#rules' do
    it 'returns rules parsed' do
      element = [{ rule_type: 'EchoRule' }].to_json
      parser.parse(element)
      expect(parser.rules).to include(EchoRule)
    end
  end

  context '#parse' do
    it 'parses json elements and build rules accordingly' do
      expect(mapper).to receive(:rule_factory_by)
      expect(factory).to receive(:create)
      element = [{ rule_type: 'EchoRule' }].to_json
      parser.parse(element)
    end
  end
end
