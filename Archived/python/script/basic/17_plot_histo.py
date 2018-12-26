import numpy as np
import matplotlib.pyplot as plt

lines = np.loadtxt('midterm.txt')

#print (lines[:,0])
#print (lines[:,1])

_ = plt.hist(lines[:,1], bins=10,facecolor='yellow', edgecolor='blue')

#plt.show()
plt.savefig("histo.png",dpi=300,format="png")
