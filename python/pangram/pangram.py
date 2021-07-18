from string import ascii_lowercase

def is_pangram(sentence):
    uniq_alpha = set(char for char in sentence.lower() if char in ascii_lowercase)
    return len(uniq_alpha) == len(ascii_lowercase)
     
