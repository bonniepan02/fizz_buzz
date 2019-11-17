require 'rule_repository'
require 'rules/echo_rule'

describe RuleRepository do
  let(:config_parser) { double('config_parser') }
  let(:config_path) { File.expand_path('../rule_files/test.json', __dir__) }

  before do
    echo_rule = EchoRule.new
    allow(config_parser).to receive(:parse).and_return([echo_rule])
  end

  subject(:rule_repository) do
    RuleRepository.new(config_path: config_path,
                       config_parser: config_parser)
  end

  context '#rule' do
    it 'returns the first rule parsed from the config' do
      expect(rule_repository.rule).to be_a(EchoRule)
    end
  end
end
