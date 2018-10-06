import numpy as np
import matplotlib.pyplot as plt

lines = np.loadtxt('wave.txt')

#print lines[:,0]
#print lines[:,1]

plt.plot(lines[:,0],lines[:,1], '-')
plt.xlabel("sec") 
plt.ylabel("counts") 
plt.title("wave") 

#plt.show()
plt.savefig("wave.png",dpi=300,format="png")
