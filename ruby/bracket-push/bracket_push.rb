class Brackets
  def self.paired?(str)
    sequence(str).each_with_object([]) do |bracket, stack|
      if MATCH_PAIRS.values.include?(bracket)
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

  private
  MATCH_PAIRS = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
end
