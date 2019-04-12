class Twelve
  GIFTS = {
    first: 'and a Partridge in a Pear Tree',
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

  def self.song
    (1..GIFTS.size).map { |number| verses(number) }.join("\n")
  end

  def self.verses(number)
    index = number - 1

    "On the #{day_number(index)} day of Christmas my true love gave to me: "\
      "#{gifts(index)}.\n"
  end

  def self.day_number(index)
    GIFTS.keys[index]
  end

  def self.gifts(index)
    gifts = GIFTS.values
    return gifts.first.gsub('and ', '') if index.zero?

    gifts[0..index].reverse.join(', ')
  end
end
