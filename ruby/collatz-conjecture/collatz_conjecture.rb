class CollatzConjecture
  def self.steps(number)
    raise ArgumentError if number < 1

    steps = 0
    until number.eql?(1)
      number = process(number)
      steps += 1
    end
    steps
  end

  def self.process(number)
    if number.even?
      number / 2
    else
      3 * number + 1
    end
  end
end
