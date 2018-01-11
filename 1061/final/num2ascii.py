import numpy as np

def num2ascii(grayscale):
    ascii_luminance_map = "@%#*+=-:. "
    map_length = len(ascii_luminance_map)-1
    character = ascii_luminance_map[int(round(grayscale*map_length/255))]

    return character


x = 121
data = np.loadtxt('image_121x113.txt')
# data = range(256)

a = list()
for i in data:
    a.append(num2ascii(i))


f = open('image.txt', 'w')

count = 0
for i in a:
    s = str(i)
    f.write(s)
    count += 1
    if (count%x) == 0:
        f.write("\n")

f.close()

