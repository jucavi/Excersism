import numpy as np

class Matrix:
    def __init__(self, matrix_string):
        self.rows = np.array([[int(n) for n in row.split()] for row in matrix_string.splitlines()])

    def row(self, index):
        return self.rows[index - 1].copy()

    def column(self, index):
        return self.rows.T[index - 1]

s = '1 2 3\n4 5 6\n7 8 9'
m = Matrix(s)

m.column(2)[1] = 0
print(m.rows)