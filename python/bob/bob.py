def response(hey_bob):
    import re
    
    hey_bob = hey_bob.strip()
    
    with_alpha = re.compile('[a-zA-Z]+')
    match = re.findall(with_alpha, hey_bob)
    
    if not hey_bob:
        return 'Fine. Be that way!'
    
    if not match:
        if hey_bob.endswith('?'):
            return 'Sure.'
        else:
            return 'Whatever.'
    
    if hey_bob.endswith('?'):
        if hey_bob.upper() == hey_bob:
            return 'Calm down, I know what I\'m doing!'
        else:
            return 'Sure.'
        
    if hey_bob.upper() == hey_bob:
        return 'Whoa, chill out!'
    
    return 'Whatever.'