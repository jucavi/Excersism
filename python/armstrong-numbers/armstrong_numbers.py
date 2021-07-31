def is_armstrong_number(number):
    digits = [int(n) for n in list(str(number))]
    pow = len(digits)

    return number == sum(digit**pow for digit in digits)

    