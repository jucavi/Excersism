def is_isogram(string):
    string = string.lower()
    return all(string.count(char) == 1 for char in string if char not in '- ')