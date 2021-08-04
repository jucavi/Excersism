def is_valid(isbn, format=10):
    if isbn:
        d_isbn = [d for parse in isbn.split('-') for d in parse]
    else:
        return False

    if len(d_isbn) != format: return False
    if any(d.isalpha() for d in d_isbn[:format - 1]): return False

    if d_isbn[-1].isalpha():
        if d_isbn[-1].lower() == 'x': 
            d_isbn[-1] = '10'
        else:
            return False

    checksum = sum(int(digit) * multiplier for multiplier, digit in enumerate(d_isbn[::-1], start=1))

    return  checksum % 11 == 0
