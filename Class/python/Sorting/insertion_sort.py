def insertion_sort(list, column):
    for i in range(1, len(list)):
        X = list[i]
        for j in range(i - 1, -1, -1):
            if list[j][column] > X[column]:
                list[j + 1] = list[j]
            else:
                break
            list[j] = X
    return list


def display_data(data):
    for row in data:
        print(row)


with open("midterm.txt", "r") as file:
    data = []

    while True:
        row = file.readline().split()
        if len(row) == 0:
            break

        converted_row = []
        for item in row:
            try:
                item = int(item)
            except ValueError:
                pass
            converted_row.append(item)

        data.append(converted_row)

display_data(data)

print("")
sorted_data = insertion_sort(data, 0)
display_data(sorted_data)

with open("sorted_midterm.txt", "w") as output:
    for row in sorted_data:
        string = ""
        for item in row:
            string = string + str(item) + " "
        output.write(string + "\n")
