import sys
import os
import time

PACKAGE_PARENT = '..'
SCRIPT_DIR = os.path.dirname(os.path.realpath(os.path.join(os.getcwd(), os.path.expanduser(__file__))))
sys.path.append(os.path.normpath(os.path.join(SCRIPT_DIR, PACKAGE_PARENT)))

from Final.matrix import Matrix, Zeros, Ones
import matplotlib.pyplot as plt
import numpy as np

matrix1 = [[1, 0, 0],
           [0, 1, 0],
           [0, 0, 1]]

matrix2 = [[1, 2, 3],
           [4, 5, 6],
           [7, 8, 9]]

m1 = Matrix(matrix1)
m2 = Matrix(matrix2)

m3 = m1 + m2
print(m3)

t = time.time()
for i in range(10000):
    m3 = m1 + m2
elapsed = time.time() - t
print(elapsed)


loops = 500
np_test = []
for i in range(loops):
    z1 = np.zeros((i + 1, i + 1))
    t = time.time()

    m4 = z1 + z1

    elapsed = time.time() - t
    np_test.append(elapsed)

matrix_test = []
for i in range(loops):
    z1 = Zeros((i + 1, i + 1))
    t = time.time()

    m4 = z1 + z1

    elapsed = time.time() - t
    matrix_test.append(elapsed)

x = np.arange(len(np_test))

plt.plot(x, np_test, label="numpy")
plt.plot(x, matrix_test, label="matrix")
plt.title("Time Benchmark")
plt.xlabel("Size N")
plt.ylabel("Sec")
plt.legend()
plt.show()
