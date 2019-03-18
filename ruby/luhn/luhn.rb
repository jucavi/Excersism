class Luhn
  def initialize(str)
    @str = str
  end

  def self.valid?(str)
    Luhn.new(str).valid?
  end

  def valid?
    valid_input? && (checksum % 10).zero?
  end

  private

  def digits
    @str.scan(/\d/).map(&:to_i)
  end

  def all_digits_or_spaces?
    @str.chars.all? { |chr| chr =~ /[\d\s]/ }
  end

  def valid_input?
    all_digits_or_spaces? && digits.length > 1
  end

  def double(num)
    (num *= 2) > 9 ? num - 9 : num
  end

  def checksum
    digits.reverse.each_slice(2).sum { |even, odd = 0| even + double(odd) }
  end
end
