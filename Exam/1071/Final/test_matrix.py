import sys
import os

PACKAGE_PARENT = '..'
SCRIPT_DIR = os.path.dirname(os.path.realpath(os.path.join(os.getcwd(), os.path.expanduser(__file__))))
sys.path.append(os.path.normpath(os.path.join(SCRIPT_DIR, PACKAGE_PARENT)))

import unittest
from Final.matrix import Matrix, Zeros, Ones


class TestMatrix(unittest.TestCase):

    def test_print(self):
        data1 = [[1, 0, 0],
                 [0, 1, 0],
                 [0, 0, 1]]

        m1 = Matrix(data1)
        self.assertEqual(m1.__str__(), "1\t0\t0\t\n0\t1\t0\t\n0\t0\t1\t\n")

    def test_add(self):
        data1 = [[1, 0, 0],
                 [0, 1, 0],
                 [0, 0, 1]]

        data2 = [[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9]]

        m1 = Matrix(data1)
        m2 = Matrix(data2)

        answer = [[2, 2, 3],
                  [4, 6, 6],
                  [7, 8, 10]]

        m_ans = Matrix(answer)

        m3 = m1 + m2
        self.assertEqual(m3, m_ans)

    def test_sub(self):
        data1 = [[1, 0, 0],
                 [0, 1, 0],
                 [0, 0, 1]]

        data2 = [[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9]]

        m1 = Matrix(data1)
        m2 = Matrix(data2)

        answer = [[0, 2, 3],
                  [4, 4, 6],
                  [7, 8, 8]]

        m_ans = Matrix(answer)

        m3 = m2 - m1
        self.assertEqual(m3, m_ans)

    def test_mul(self):
        data1 = [[1, 4, 7],
                 [1, 2, 3],
                 [5, 6, 4]]

        data2 = [[5, 4, 3],
                 [7, 8, 9],
                 [6, 1, 2]]

        m1 = Matrix(data1)
        m2 = Matrix(data2)

        answer = [[75, 43, 53],
                  [37, 23, 27],
                  [91, 72, 77]]

        m_ans = Matrix(answer)

        m3 = m1 * m2
        self.assertEqual(m3, m_ans)

    def test_transpose(self):
        data1 = [[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9]]

        m1 = Matrix(data1).transpose()

        answer = [[1, 4, 7],
                  [2, 5, 8],
                  [3, 6, 9]]

        m_ans = Matrix(answer)

        self.assertEqual(m1, m_ans)


class TestZeros(unittest.TestCase):
    def test_zeros(self):
        data1 = [[0, 0, 0],
                 [0, 0, 0],
                 [0, 0, 0]]

        m1 = Matrix(data1)
        z1 = Zeros((3, 3))
        self.assertEqual(m1, z1)


class TestOnes(unittest.TestCase):
    def test_ones(self):
        data1 = [[1, 0, 0],
                 [0, 1, 0],
                 [0, 0, 1]]

        m1 = Matrix(data1)
        z1 = Ones((3, 3))
        self.assertEqual(m1, z1)


if __name__ == '__main__':
    unittest.main()
