require 'fizz_buzz'
require 'rules/echo_rule'
require 'rule_factory_mapper'
require 'rule_parser'

describe FizzBuzz do
  context '#initilize' do
    it 'collaberates with rule parser and rule factory' do
      expect(RuleFactoryMapper).to receive(:new)
      expect(RuleParser).to receive(:new)
      FizzBuzz.new
    end
  end

  context '#get_string' do
    it 'execute rule and return its result' do
      echo_rule = double(EchoRule)
      allow(echo_rule).to receive(:get_string).and_return('echo')
      fizz_buzz = FizzBuzz.new
      expect(fizz_buzz.get_string(1)).to eql('echo')
    end
  end
end
