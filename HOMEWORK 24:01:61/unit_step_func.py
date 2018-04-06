import matplotlib.pyplot as plt
 
npoints=50
x = list(range(-5, 5))
def unit_step(x,a):
    result = 0
    if x < a:
        result = 0
    elif x >= a :
        result = 1
    return result
        
y = [unit_step(t,0) for t in x]
plt.figure(figsize=(10, 5))
plt.title('Unit step function')
plt.xlabel('x')
plt.ylabel('unit_step (t)')
plt.grid(True)

 
plt.plot(x, y, color="blue")
 
plt.show()