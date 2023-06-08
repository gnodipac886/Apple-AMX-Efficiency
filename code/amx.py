from ctypes import *
import numpy as np

# import the amx helpers
so_file = 'amx.so'
amx_funcs = CDLL(so_file)

def amx_u16_matmul(a: np.array, b: np.array):
	c = np.zeros(a.shape, dtype=np.uint32)
	aT = a.T.copy()
	amx_funcs._amx_set()
	amx_funcs.amx_u16_gemm_32x32(aT.ctypes.data_as(c_void_p), b.ctypes.data_as(c_void_p), c.ctypes.data_as(c_void_p), 32)
	amx_funcs._amx_clr()
	# print(c, c.shape)
	return c

def amx_fp32_matmul(a: np.array, b: np.array):
	c = np.zeros(a.shape, dtype=np.float32)
	aT = a.T.copy()
	amx_funcs._amx_set()
	amx_funcs.amx_fp32_gemm_16x16(aT.ctypes.data_as(c_void_p), b.ctypes.data_as(c_void_p), c.ctypes.data_as(c_void_p), 16)
	amx_funcs._amx_clr()
	# print(c, c.shape)
	return c

while True:
	a = np.random.rand(16, 16).astype(np.float32)
	# a = np.ones((16, 16), dtype=np.float32) * -8.5
	# a = np.eye(16, dtype=np.float32) * -8.5
	# a = np.array([[float(i) for i in range(16)] for _ in range(16)]).astype(np.float32)
	b = np.random.rand(16, 16).astype(np.float32)
	b = np.eye(16, dtype=np.float32)
	c = amx_fp32_matmul(a, b)
	if not np.all(c == (a @ b)):
		break
# print(c)
print(np.all(c == (a @ b)))
# print(a @ b)

# while True:
# 	a = np.random.randint(0, 50, size=(32, 32), dtype=(np.uint16))
# 	b = np.random.randint(0, 50, size=(32, 32), dtype=(np.uint16))
# 	c = amx_u16_matmul(a, b)

# 	if not np.all(c == a @ b):
# 		print('gold')
# 		amx_funcs.print_imatrix(np.matmul(a, b).ctypes.data_as(c_void_p), 32, 32, 2)
# 		print(c == a @ b)
# 		break