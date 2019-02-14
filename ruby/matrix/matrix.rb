class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = rows_generator(str)
    @columns = columns_generator
  end

  private
  def rows_generator(str)
    str.lines.map do |sub_str|
      get_row(sub_str)
    end
  end

  def get_row(str)
    str.strip.split.map(&:to_i)
  end

  def columns_generator
    rows.transpose
  end
end
