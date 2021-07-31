def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b): raise ValueError('Strands must have the same length.')
    return sum(1 for piece_a, piece_b in zip(strand_a, strand_b) if piece_a != piece_b)
