class Luhn
  def initialize(str)
    @code = str.scan(/[^\s]/)
  end

  def self.valid?(str)
    Luhn.new(str).valid?
  end

  def valid?
    return false if @code.any?(/[^\d]/)
    return false if @code.length < 2

    (checksum % 10).zero?
  end

  private

  def digits
    @code.map(&:to_i)
  end

  def double(num)
    (num *= 2) > 9 ? num - 9 : num
  end

  def checksum
    digits.reverse.each_slice(2).sum { |even, odd = 0| even + double(odd) }
  end
end
