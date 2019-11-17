class ModRule
  def initialize(modulus:, output:)
    @modulus = modulus
    @output = output
  end

  def get_string(num:)
    return nil if num.nil?
    
    @output if (num % @modulus).zero?
  end
end
