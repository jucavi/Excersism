class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = rows_generator(str)
    @columns = columns_generator
  end

  def rows_generator(str)
    str.lines.map { |sub_str| get_row(sub_str) }
  end

  def get_row(str)
    str.strip.split.map(&:to_i)
  end

  def columns_generator
    rows.transpose
  end

  private :rows_generator, :get_row, :columns_generator
end
