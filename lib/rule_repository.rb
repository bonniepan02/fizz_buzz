class RuleRepository
  def initialize(config_path:, config_parser:)
    @config_path = config_path
    @config_parser = config_parser
  end
end
