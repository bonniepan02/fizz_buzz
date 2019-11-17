shared_examples 'rule' do
  context 'validating contract' do
    it 'should respond to get_string with_keywords num' do
      expect(rule).to respond_to(:get_string).with_keywords(:num)
    end
  end

  context '#get_string' do
    it 'should return nil if rule does not match' do
      expect(rule.get_string(num: nil)).to eq(nil)
    end
  end
end
