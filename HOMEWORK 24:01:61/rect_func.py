import matplotlib.pyplot as plt
 
npoints=50
x = list(range(-100, 100))
def unit_step(x,a):
    result = 0
    if x < a:
        result = 0
    elif x >= a:
        result = 1
    return result

def rect(x,a,b):
    result = 0
    result = unit_step(x,0)-unit_step(x,10)
    return result

y = [rect(t,0,10) for t in x]
plt.figure(figsize=(10, 5))
plt.title('rectangular function')
plt.xlabel('x')
plt.ylabel('rectangular (t)')
plt.grid(True)
plt.xlim(-10,20)
plt.ylim(-0.1,1.1)

plt.plot(x, y, color="blue")
 
plt.show()