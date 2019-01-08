class Matrix:
    def __init__(self, data=None):
        self.data = data
        self.shape = self._get_shape()

    def _get_shape(self):
        i = len(self.data)
        j = len(self.data[0])
        return i, j

    def __str__(self):
        string = ""
        for row in self.data:
            row_str = ""
            for item in row:
                row_str = row_str + str(item) + "\t"
            string = string + row_str + "\n"
        return string

    def __getitem__(self, item):
        return self.data[item]

    def __setitem__(self, key, value):
        self.data[key] = value

    def __eq__(self, other):
        if self.data == other.data:
            return True

    def __add__(self, other):
        if self.shape == other.shape:
            new_matrix = Zeros(self.shape)
            row, col = self.shape
            for i in range(row):
                for j in range(col):
                    new_matrix[i][j] = self[i][j] + other[i][j]
            return new_matrix
        else:
            err = str(self.shape) + " is not matched by " + str(other.shape)
            raise IndexError(err)

    def __sub__(self, other):
        pass

    def __mul__(self, other):
        pass

    def transpose(self):
        pass


class Zeros(Matrix):
    def __init__(self, shape):
        data = self._zeros(shape)
        super().__init__(data)

    @staticmethod
    def _zeros(shape=None):
        row, col = shape
        zeros = []
        for i in range(row):
            new_row = []
            for j in range(col):
                new_row.append(0)
            zeros.append(new_row)
        return zeros


class Ones(Matrix):
    pass
