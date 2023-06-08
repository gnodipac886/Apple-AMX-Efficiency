import numpy as np
import threading
from time import sleep

iterations = 0
a = np.ones((16, 16), dtype=float)
b = np.ones((16, 16), dtype=float)

def sleep_thread():
    sleep(55)
    print("Iterations: ", iterations)
    exit(0)

if __name__ == '__main__':
	threading.Thread(target=sleep_thread).start()

	while True:
		for _ in range(10000):
			c = a @ b
		iterations += 10000