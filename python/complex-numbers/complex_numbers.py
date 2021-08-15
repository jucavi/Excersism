import math

class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self, other):
        return (self.real == other.real and self.imaginary == other.imaginary)

    def __add__(self, other):
        return ComplexNumber(self.real + other.real, self.imaginary + other.imaginary)

    def __mul__(self, other):
        real = self.real * other.real - self.imaginary * other.imaginary
        imaginary = self.imaginary * other.real + self.real * other.imaginary
        return ComplexNumber(real, imaginary)

    def __sub__(self, other):
        return ComplexNumber(self.real - other.real, self.imaginary - other.imaginary)

    def __truediv__(self, other):      
        if (self.imaginary != 0 or other.imaginary != 0):
            denominator = other.real**2 + other.imaginary**2
            real, imaginary = self * other.conjugate()
            return ComplexNumber(real / denominator, imaginary / denominator)

        return ComplexNumber(self.real / other.real, 0)
            
    def __abs__(self):
        return math.sqrt(self.real**2 + self.imaginary**2)
    
    def __iter__(self):
        return iter((self.real, self.imaginary))
        
    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        m = math.e**self.real
        
        return ComplexNumber(m*math.cos(self.imaginary), m*math.sin(self.imaginary))
