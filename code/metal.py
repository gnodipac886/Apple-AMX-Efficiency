import torch
import threading
from time import sleep

iterations = 0

def sleep_thread():
    sleep(55)
    print("Iterations: ", iterations)
    exit(0)

if __name__ == '__main__':
	threading.Thread(target=sleep_thread).start()

	while True:
		a = torch.randn((32, 32), dtype=torch.float32).to('mps')
		b = torch.randn((32, 32), dtype=torch.float32).to('mps')
		for _ in range(256):
			c = a @ b
		iterations += 256