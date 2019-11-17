class FirstMatchRule
  def initialize(rules)
    @rules = rules
  end

  def get_string(num:)
    @rules.each do |rule|
      matched = rule.get_string(num: num)
      return matched if matched
    end
    nil
  end
end
