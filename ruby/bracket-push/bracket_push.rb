class Brackets
  MATCH_PAIRS = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }.freeze

  def self.paired?(str)
    sequence(str).each_with_object([]) do |bracket, stack|
      if MATCH_PAIRS.value?(bracket)
        stack << bracket
      elsif stack.last.eql?(MATCH_PAIRS[bracket])
        stack.pop
      else
        return false
      end
    end.empty?
  end

  def self.sequence(str)
    str.chars.select { |char| (MATCH_PAIRS.keys | MATCH_PAIRS.values).include?(char) }
  end

  private_constant :MATCH_PAIRS
end
