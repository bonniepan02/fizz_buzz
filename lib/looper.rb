require 'rule_factory_mapper'
require 'fizz_buzz'
require 'rule_config_parser'
require 'rule_repository'

# Loop through to concatenate fizzbuzz run rule results
class Looper
  DELIMETER = ' '.freeze

  def initialize
    mapper = RuleFactoryMapper.new
    parser = RuleConfigParser.new(mapper)
    config_path = File.expand_path('../rule_files/test.json', __dir__)
    rule_repository = RuleRepository.new(config_path: config_path,
                                         config_parser: parser)

    @fizz_buzz = FizzBuzz.new(rule_repository)
  end

  def run(num)
    result = (1..num).map { |i| @fizz_buzz.run_rule(i) }
    result.join(DELIMETER)
  end
end
