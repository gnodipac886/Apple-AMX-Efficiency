#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "amx.h"
#include "amx_imatmul.h"

#define NUM_XY_REG 2

int main() {
	int K = 1;
	uint16_t * A 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * AT 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * B 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint32_t * C 	= (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));

	uint32_t * golden = (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));

	set_eye_matrix_u16(A, AMX_SIZE, K);
	set_eye_matrix_u16(B, K, AMX_SIZE);

	// A[1] = 1;
	// B[1] = 1;
	_amx_set();
	// TODO: YOUR CODE HERE:
	// AMX_LDX(A);
	// AMX_LDY(B);
	// _amx_dump_x_reg(0);
	// _amx_dump_y_reg(0);
	// AMX_MATINT(SHIFT_DATA(3, 4, 42));
	// _amx_dump_z_reg();
	_amx_clr();

	// matrix_transpose(A, AT, AMX_SIZE, K, sizeof(uint16_t));

	// printf("A: \n");
	// print_imatrix(AT, AMX_SIZE, K, sizeof(uint16_t));

	// printf("B: \n");
	// print_imatrix(B, K, AMX_SIZE, sizeof(uint16_t));

	// amx_u16gemm_32x32(AT, B, C, K);
	// printf("C: \n");
	// print_imatrix(C, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	// printf("\n\n");

	// gemm_u16(A, B, golden, AMX_SIZE, K, AMX_SIZE);
	// print_imatrix(golden, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	// compare_matrix_u32(C, golden, AMX_SIZE, AMX_SIZE);
	// printf("Comparison: \n");
	// print_imatrix(golden, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	free(A);
	free(B);
	free(C);
	free(golden);
	return 0;
}