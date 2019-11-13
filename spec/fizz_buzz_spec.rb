require 'fizz_buzz'

describe FizzBuzz do
  subject(:fizzbuzz) { FizzBuzz.new }

  describe '.get_string' do
    context 'given 1' do
      it 'returns 1' do
        expect(fizzbuzz.get_string(1)).to eql('1')
      end
    end

    context 'divisible by 3' do
      it 'given 3' do
        expect(fizzbuzz.get_string(3)).to eql('fizz')
      end

      it 'given 6' do
        expect(fizzbuzz.get_string(6)).to eql('fizz')
      end

      it 'given 9' do
        expect(fizzbuzz.get_string(9)).to eql('fizz')
      end
    end

    context 'divisible by 5' do
      it 'given 5' do
        expect(fizzbuzz.get_string(5)).to eql('buzz')
      end

      it 'given 10' do
        expect(fizzbuzz.get_string(10)).to eql('buzz')
      end

      it 'given 20' do
        expect(fizzbuzz.get_string(20)).to eql('buzz')
      end
    end

    context 'divisible by 7' do
      it 'given 7' do
        expect(fizzbuzz.get_string(7)).to eql('bang')
      end

      it 'given 14' do
        expect(fizzbuzz.get_string(14)).to eql('bang')
      end

      it 'given 49' do
        expect(fizzbuzz.get_string(49)).to eql('bang')
      end
    end

    context 'composite of divisibles' do
      it 'given 3 and 5' do
        expect(fizzbuzz.get_string(15)).to eql('fizzbuzz')
      end

      it 'given 3 and 7' do
        expect(fizzbuzz.get_string(21)).to eql('fizzbang')
      end

      it 'given 5 and 7' do
        expect(fizzbuzz.get_string(35)).to eql('buzzbang')
      end

      it 'given 3 & 5 & 7' do
        expect(fizzbuzz.get_string(105)).to eql('fizzbuzzbang')
      end
    end
  end
end
