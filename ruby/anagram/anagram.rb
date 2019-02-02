class Anagram
  def initialize(anagram)
    @anagram = anagram
  end

  def match(list)
    list.select { |word| match_word?(word) }
  end

  def match_word?(word)
    @anagram.casecmp(word) != 0 && eql_format?(word)
  end

  def eql_format?(word)
    @anagram.downcase.chars.sort == word.downcase.chars.sort
  end
end
