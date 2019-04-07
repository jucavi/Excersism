class Clock
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = 1440

  def initialize(hour: 0, minute: 0)
    @minutes = ((hour * MINUTES_PER_HOUR) + minute) % MINUTES_PER_DAY
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
    minutes == other.minutes
  end

  protected

  attr_reader :minutes

  private

  def to_24
    @minutes.divmod(MINUTES_PER_HOUR)
  end
end
