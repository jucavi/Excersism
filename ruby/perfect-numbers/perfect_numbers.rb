class PerfectNumber
  CATEGORIES = {
    -1 => 'deficient',
    0 => 'perfect',
    1 => 'abundant'
  }.freeze

  def self.classify(number)
    raise RuntimeError if number < 0

    key = factors(number).sum <=> number
    CATEGORIES[key]
  end

  def self.factors(number)
    (1...number).to_a.map { |n| n if (number % n).zero? }.compact
  end
end
