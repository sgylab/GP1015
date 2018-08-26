import numpy as np
import cv2  # OpenCV

image_file = 'ok.PNG'


img = cv2.imread(image_file, 0)
txt = img.ravel()

np.savetxt('image_121x113.txt', txt, fmt='%3i')
