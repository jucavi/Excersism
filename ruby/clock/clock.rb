class Clock
  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * 60) + minute
  end

  def to_s
    format('%02d:%02d', *to_24)
  end

  def +(other)
    Clock.new(minute: minutes + other.minutes)
  end

  def -(other)
    Clock.new(minute: minutes - other.minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def to_24
    hours, minutes = @minutes.divmod(60)

    return [hours, minutes] if hours.between?(0, 23)
    return [0, minutes] if hours == 24

    hours %= 24

    [hours, minutes]
  end
end
