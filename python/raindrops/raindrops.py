def convert(number):
    pot_sounds = {
        3: 'Pling',
        5: 'Plang',
        7: 'Plong'
    }
    return ''.join(sound for divisor, sound in pot_sounds.items() if number % divisor == 0) or str(number)