class Triangle
  attr_reader :sides

  TRIANGLE = {
    equilateral: 1,
    isosceles: 2,
    scalene: 3
  }.freeze

  def initialize(sides)
    @sides = sides
  end

  def valid_sides?
    a, b, c = sides
    a + b > c && a > 0
  end

  def eql_sides?
    sides.uniq.size
  end

  def define_meth(meth, triangle_name)
    define_singleton_method(meth) do
      expected = TRIANGLE[triangle_name] == eql_sides? && valid_sides?
      "Expected '#{expected}', triangle #{sides} is
       #{'not' if expected} #{triangle_name}."
    end
    send(meth)
  end

  def method_missing(meth, *args, &blk)
    triangle = meth.match(/(.+)\?$/)
    if triangle[1] && TRIANGLE.key?(triangle[1].to_sym)
      define_meth(meth, triangle[1].to_sym)
    else
      super
    end
  end
end
