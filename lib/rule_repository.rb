class RuleRepository
  def initialize(config_path:, config_parser:)
    @config_path = config_path
    @config_parser = config_parser
    config_content = File.read(config_path)
    @rules = config_parser.parse(config_content)
  end

  def rule
    @rules.first
  end
end
