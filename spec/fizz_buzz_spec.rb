require 'fizz_buzz'

describe FizzBuzz do
  let(:repository) { double('rule_repository') }

  context '#run_rule' do
    it 'execute rule and return its result' do
      rule = double('echo_rule')
      allow(rule).to receive(:get_string).and_return('echo')
      allow(repository).to receive(:rule).and_return(rule)

      fizz_buzz = FizzBuzz.new(repository)
      expect(fizz_buzz.run_rule(1)).to eql('echo')
    end
  end
end
