def recite(start_verse, end_verse):
    """Retuns a list of verses fron start_verse to end_verse of 'The Twelve Days of Christmas' song"""

    GIFTS = [
        'a Partridge in a Pear Tree',
        'two Turtle Doves',
        'three French Hens',
        'four Calling Birds',
        'five Gold Rings',
        'six Geese-a-Laying',
        'seven Swans-a-Swimming',
        'eight Maids-a-Milking',
        'nine Ladies Dancing',
        'ten Lords-a-Leaping',
        'eleven Pipers Piping',
        'twelve Drummers Drumming'
    ]

    DAYS = [
        'first',
        'second',
        'third',
        'fourth',
        'fifth',
        'sixth',
        'seventh',
        'eighth',
        'ninth',
        'tenth',
        'eleventh',
        'twelfth'
    ]

    def verse_gifts(verse):
        """Returns string of gifts for current verse"""

        last, *rest = GIFTS[:verse]
        if rest:
           return ', and '.join([', '.join(rest[::-1]), last])
        return last

    song_verses = [
        f'On the {day} day of Christmas my true love gave to me: {verse_gifts(verse)}.'
        for verse, day in enumerate(DAYS[start_verse - 1 : end_verse], start=start_verse)
    ]
        
    return song_verses
