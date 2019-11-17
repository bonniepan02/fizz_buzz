require 'looper'
require 'fizz_buzz'

describe Looper do
  context 'guiding real test' do
    xit '#run' do
      looper = Looper.new
      expect(looper.run(100)).to eql('1 2 fizz 4 buzz fizz bang 8 fizz buzz 11 fizz 13 bang fizzbuzz 16 17 fizz 19 buzz fizzbang 22 23 fizz buzz 26 fizz bang 29 fizzbuzz 31 32 fizz 34 buzzbang fizz 37 38 fizz buzz 41 fizzbang 43 44 fizzbuzz 46 47 fizz bang buzz fizz 52 53 fizz buzz bang fizz 58 59 fizzbuzz 61 62 fizzbang 64 buzz fizz 67 68 fizz buzzbang 71 fizz 73 74 fizzbuzz 76 bang fizz 79 buzz fizz 82 83 fizzbang buzz 86 fizz 88 89 fizzbuzz bang 92 fizz 94 buzz fizz 97 bang fizz buzz')
    end
  end

  context 'calls fizzbuzz in a loop' do
    it '#run(2)' do
      fizz_buzz = double(FizzBuzz)
      allow(fizz_buzz).to receive(:run_rule).and_return('fizz')
      allow(FizzBuzz).to receive(:new).and_return(fizz_buzz)
      looper = Looper.new
      expect(looper.run(2)).to eql('fizz fizz')
    end
  end
end
