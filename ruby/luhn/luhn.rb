class Luhn
  def initialize(str)
    @code = code_generator(str)
  end

  def self.valid?(str)
    Luhn.new(str).valid?
  end

  def valid?
    valid_length? ? divisible? : false
  end

  private
  def code_generator(str)
    all_digits_or_spaces?(str) ? str.scan(/\d/).map(&:to_i) : []
  end

  def all_digits_or_spaces?(str)
    str.chars.all? { |chr| chr =~ /[\d\s]/ }
  end

  def valid_length?
    @code.length > 1
  end

  def double(num)
    (num *= 2) > 9 ? num -= 9 : num
  end

  def second_double
    @code.reverse
      .map
      .with_index { |num, index| index.odd? ? double(num) : num }
  end

  def sum
    second_double.sum
  end

  def divisible?
    (sum % 10).zero?
  end
end
