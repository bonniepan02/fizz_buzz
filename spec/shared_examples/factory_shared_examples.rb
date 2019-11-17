shared_examples 'factory' do
  context 'validating contract' do
    it 'should respond to create with_keywords element' do
      expect(factory).to respond_to(:create).with_keywords(:element)
    end
  end
end
