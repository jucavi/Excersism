class Luhn
  def initialize(str)
    @str = str
  end

  def self.valid?(str)
    Luhn.new(str).valid?
  end

  def valid?
    valid_string? ? (digit_sum % 10).zero? : false
  end

  private
  def valid_string?
    all_digits_or_spaces? && valid_length?
  end

  def all_digits_or_spaces?
    @str.chars.all? { |chr| chr =~ /[\d\s]/ }
  end

  def valid_length?
    code.length > 1
  end

  def code
    @str.scan(/\d/).map(&:to_i)
  end

  def double(num)
    (num *= 2) > 9 ? num -= 9 : num
  end

  def double_second_digit
    code.reverse
        .map
        .with_index { |num, index| index.odd? ? double(num) : num }
  end

  def digit_sum
    double_second_digit.sum
  end
end
