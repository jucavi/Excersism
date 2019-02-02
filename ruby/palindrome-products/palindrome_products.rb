class Palindromes
  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
  end

  def generate

  end

  def palindrome?(number)
    number.to_s.reverse = number.to_s
  end

  def factors(number)
    (1..Math.sqrt(number)).select do |divisor|
    end
  end
end

b = Palindromes.new(max_factor: 999)
puts b.inspect
b.generate
