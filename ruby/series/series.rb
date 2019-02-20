class Series
  def initialize(str)
    @serie = str.chars
  end

  def slices(n_digit)
    message = "number of digits too high for this series"
    raise ArgumentError, message if n_digit > serie.size
    return serie if n_digit == 1
    serie.each_cons(n_digit).map(&:join)
  end

  private
  attr_reader :serie
end
