import matplotlib.pyplot as plt
import math
npoints=50
x = list(range(-100, 100))
y = [math.exp(i) for i in x]

plt.figure(figsize=(10, 5))
plt.title('exponential function')
plt.ylabel('x')
plt.xlabel('exp(x)')
plt.stem( x, y, linefmt='b-', basefmt=' ' );
plt.grid(True)
plt.xlim(-1,10)
plt.ylim(-100,10000)
plt.show()
