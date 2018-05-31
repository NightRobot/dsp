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

def ramp(x,a):
    result = 0
    if x < a :
        result = unit_step(x,0)*x
    elif x >= a:
        result = unit_step(x,0)*a
    return result
y = [ramp(t,10) for t in x]
plt.figure(figsize=(10, 5))
plt.title('ramp function')
plt.xlabel('x')
plt.ylabel('ramp (t)')
plt.grid(True)
plt.xlim(-10,20)
plt.ylim(-0.1,10.1)

plt.plot(x, y, color="blue")

plt.show()
