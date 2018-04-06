import matplotlib.pyplot as plt
from math import sin, cos, pi
 
npoints=50
x = [x*2*pi/npoints for x in range(npoints+1)]
y = [sin(t) for t in x]
 
plt.figure(figsize=(10, 5))
plt.title('Sine function')
plt.xlabel('radians')
plt.ylabel('sin (t)')
plt.grid(True)
plt.xlim(0,2*pi)
plt.ylim(-1.1,1.1)
 
plt.plot(x, y, color="blue", label="sine")
 
plt.show()