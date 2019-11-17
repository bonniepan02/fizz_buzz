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

    it 'returns multiple rules' do
      element = [{ rule_type: 'EchoRule' }, { rule_type: 'EchoRule' }].to_json
      parser.parse(element)
      expect(parser.rules.count).to eql(2)
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

  context 'integration test' do
    it 'parse a test json file' do
      mapper = RuleFactoryMapper.new
      parser = RuleConfigParser.new(mapper)
      element = "[\n    {\n        \"rules\": [\n            {\n                \"rules\": [\n                    {\n                        \"rule_type\": \"ModRule\",\n                        \"modulus\": 3,\n                        \"output\": \"fizz\"\n                    },\n                    {\n                        \"rule_type\": \"ModRule\",\n                        \"modulus\": 5,\n                        \"output\": \"buzz\"\n                    },\n                    {\n                        \"rule_type\": \"ModRule\",\n                        \"modulus\": 7,\n                        \"output\": \"bang\"\n                    }\n                ],\n                \"rule_type\": \"CombinedRule\"\n            },\n            {\n                \"rule_type\": \"EchoRule\"\n            }\n        ],\n        \"rule_type\": \"FirstMatchRule\"\n    }\n]"
      rules = parser.parse(element)
      expect(rules.count).to eql(1)
      expect(rules).to include(FirstMatchRule)
    end
  end
end
