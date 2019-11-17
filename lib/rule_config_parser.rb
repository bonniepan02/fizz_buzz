require 'json'

class RuleConfigParser
  def initialize(mapper)
    @mapper = mapper
  end

  def parse(content)
    elements = JSON.parse(content, symbolize_names: true)
    @rules = elements.map do |element|
      factory = @mapper.rule_factory_by(element[:rule_type])
      factory.create(element)
    end
  end

  attr_reader :rules
end
