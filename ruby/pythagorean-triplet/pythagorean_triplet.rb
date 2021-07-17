class Triplet
  def initialize(a, b , c)
    @triplet = [a, b, c]
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.inject(1, :*)
  end

  def pythagorean?
    a, b, c = @triplet
    (c ** 2).eql?(a ** 2 + b ** 2)
  end

  def self.find_c(a, b)
    root = Math.sqrt(a ** 2 + b ** 2)
    return root.to_i if (root % 1).zero?
  end

  def where(options = {})
    raise ArgumentError if options.empty?
  end

  def self.generate(options = {})
    raise ArgumentError if options.empty?

    (1..).each_with_object([]) do |a, acc|
      (a+1..).each do |b|
        c = find_c(a, b)
        unless c.nil?
          triplet = Triplet.new(a, b, c)
          acc << Triplet.new(a, b, c) if valid?(a, b, c, options)
        end
      end
    end
  end
end
