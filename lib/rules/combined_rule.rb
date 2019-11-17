class CombinedRule
  def initialize(rules)
    @rules = rules
  end

  def get_string(num:)
    results = @rules.map { |rule| rule.get_string(num: num) }
    return nil if results.all?(&:nil?)

    results.reject(&:nil?).join
  end
end
