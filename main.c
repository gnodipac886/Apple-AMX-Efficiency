#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "amx.h"
#include "amx_fp32.h"
#include "amx_fmatmul.h"

#define NUM_XY_REG 2

#define AMX_FLOAT32_CAPACITY 16

int main() {
	int K = AMX_FLOAT32_CAPACITY;
	float * A 	= (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
	float * AT 	= (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
	float * B 	= (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
	float * C 	= (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
	
//		set_eye_matrix_fp32(A, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY);
	set_matrix_fp32(A, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, 5.0);
	matrix_transpose_fp32(A, AT, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, sizeof(float));
	print_fpmatrix(AT, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, sizeof(float));
	
	set_eye_matrix_fp32(B, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY);
	
	_amx_set();
	amx_fp32_gemm_16x16(AT, B, C, AMX_FLOAT32_CAPACITY);
	print_fpmatrix(C, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, sizeof(float));
	_amx_clr();
	
	free(A);
	free(AT);
	free(B);
	free(C);
	return 0;
}