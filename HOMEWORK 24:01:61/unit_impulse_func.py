from scipy import signal
#create signal impluse form scipy
imp = signal.unit_impulse(100,2)

import matplotlib.pyplot as plt
plt.figure(figsize=(10, 5))
plt.title('impulse function')
plt.plot(imp)
plt.margins(0.1, 0.1)
plt.xlabel('Time [samples]')
plt.ylabel('Amplitude')
plt.xlim(-1,10)
plt.ylim(-0.1,1.1)
plt.grid(True)
plt.show()