class PerfectNumber
  CATEGORIES = {
    -1 => 'deficient',
    0  => 'perfect',
    1  => 'abundant'
  }

  def self.classify(number)
    raise RuntimeError if number < 0
    key = factors(number).sum <=> number
    CATEGORIES[key]
  end

  def self.factors(number)
    (1...number).each_with_object([]) do |n, f|
      f << n if (number % n).zero?
    end
  end
end
