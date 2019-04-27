class TwelveDays
  GIFTS = {
    first: 'a Partridge in a Pear Tree',
    second: 'two Turtle Doves',
    third: 'three French Hens',
    fourth: 'four Calling Birds',
    fifth: 'five Gold Rings',
    sixth: 'six Geese-a-Laying',
    seventh: 'seven Swans-a-Swimming',
    eighth: 'eight Maids-a-Milking',
    ninth: 'nine Ladies Dancing',
    tenth: 'ten Lords-a-Leaping',
    eleventh: 'eleven Pipers Piping',
    twelfth: 'twelve Drummers Drumming'
  }.freeze

  DAYS = GIFTS.keys

  def self.song
    (1..DAYS.size).map { |day| verse(day) }.join("\n")
  end

  def self.verse(day)
    "On the #{DAYS[day - 1]} day of Christmas my true love gave to me: " \
      "#{gifts_sentence(day)}.\n"
  end

  def self.gifts(day)
    GIFTS.values.take(day).reverse
  end

  def self.gifts_sentence(day)
    *gifts, last_gift = gifts(day)

    gifts.empty? ? last_gift : gifts.join(', ') << ", and #{last_gift}"
  end
end
