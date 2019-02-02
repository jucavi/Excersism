class SpaceAge
  def initialize(age)
    @age = age
  end

  private
  EARTH_PERIOD = 31557600
  RELATIVES_ORBITS = {
    'earth': 1,
    'mercury': 0.2408467,
    'venus':  0.61519726,
    'mars':  1.8808158,
    'jupiter':  11.862615,
    'saturn':  29.447498,
    'uranus':  84.016846,
    'neptune':  164.79132
  }

  def normalize_orbit(planet)
    (RELATIVES_ORBITS[planet] * EARTH_PERIOD).to_f
  end

  def method_missing(meth, *args, &blk)
    meth.to_s =~ /^on_(.*)$/
    if RELATIVES_ORBITS.keys.include?(:"#{$1}")
      define_singleton_method(meth) do
        @age / normalize_orbit($1.to_sym)
      end
      send(meth, *args, &blk)
    else
      super
    end
  end
end
