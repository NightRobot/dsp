import matplotlib.pyplot as plt
from math import sin, cos, pi
 
npoints=50
x = [x*2*pi/npoints for x in range(npoints+1)]
y = [cos(t) for t in x]
 
plt.figure(figsize=(10, 5))
plt.title('Cosine function')
plt.xlabel('radians')
plt.ylabel('cos (t)')
plt.grid(True)
plt.xlim(0,2*pi)
plt.ylim(-1.1,1.1)
 
plt.stem( x, y, linefmt='b-', basefmt=' ' );
 
plt.show()