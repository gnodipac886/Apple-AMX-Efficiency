#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include "amx.h"
#include "amx_imatmul.h"

#define NUM_XY_REG 2

void amx_perform_n_iouter_product(int n, uint64_t mask) {
	// perform n macs
	for (int i = 0; i < n; i++) {
		_amx_dump_x_reg(i);
		_amx_dump_y_reg(i);

		// make mac mask, set xy register offset, set z to i32 bit mode
		uint64_t mac_mask =  MAC_16_X_OFFSET(i * AMX_XY_REG_SIZE) | MAC_16_Y_OFFSET(i * AMX_XY_REG_SIZE) | mask;
		AMX_MAC16(mac_mask);
		_amx_dump_z_reg();
	}

	// printf("Performed %d outer products\n", n);
}

// num_reg should be less than AMX_XY_NUM_REG
void amx_load_xy_reg(void * buf, int reg_idx, int num_reg, amx_reg_e reg, uint64_t load_mask) {
	amx_xy_reg_t * amx_reg_ptr;
	// printf("Performing %d amx reg loads\n", num_reg);

	if (reg == AMX_X_REG)
		amx_reg_ptr = &(amx_x_reg.reg[reg_idx]);
	else
		amx_reg_ptr = &(amx_y_reg.reg[reg_idx]);

	memcpy(amx_reg_ptr, buf, num_reg * AMX_XY_REG_SIZE);

	for (int i = 0; i < num_reg; i+=2) {
		if (reg == AMX_X_REG)
			amx_reg_ptr = &(amx_x_reg.reg[reg_idx + i]);
		else
			amx_reg_ptr = &(amx_y_reg.reg[reg_idx + i]);

		uint64_t mask = load_mask | LDXY_REG_IDX(reg_idx + i) | (uint64_t)amx_reg_ptr;
		if (num_reg - i > 1)
			mask |= LDXY_MULT_REG;

		if (reg == AMX_X_REG)
			AMX_LDX(mask);
		else
			AMX_LDY(mask);
	}
}

// A num cols = B num rows = K
void amx_u16gemm_32x32(const uint16_t * A, const uint16_t * B, uint32_t * C, int K) {
	// start AMX
	_amx_set();

	for (int k = 0; k < K; k+=AMX_XY_NUM_REG) {
		int num_regs = (K - k) > AMX_XY_NUM_REG ? AMX_XY_NUM_REG : (K - k);
		amx_load_xy_reg((void*)&(((uint8_t*)A)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_X_REG, 0);
		amx_load_xy_reg((void*)&(((uint8_t*)B)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_Y_REG, 0);

		amx_perform_n_iouter_product(num_regs, MAC_16_Z_i32_i16);
	}

	// get the result back
	amx_get_z((uint32_t*)&amx_z_reg, AMX_SIZE, AMX_SIZE);
	memcpy(C, &amx_z_reg, sizeof(amx_z_reg_t));

	// end AMX
	_amx_clr();
}

int main() {
	int K = 1;
	uint16_t * A 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * AT 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * B 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint32_t * C 	= (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));

	uint32_t * golden = (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));

	// set_eye_matrix_u16(A, AMX_SIZE, K);
	// set_eye_matrix_u16(B, K, AMX_SIZE);

	A[1] = 1;
	B[1] = 1;
	_amx_set();
	AMX_LDX(A);
	AMX_LDY(B);
	_amx_dump_x_reg(0);
	_amx_dump_y_reg(0);
	AMX_MATINT(SHIFT_DATA(3, 4, 42));
	_amx_dump_z_reg();
	_amx_clr();
	exit(0);

	matrix_transpose(A, AT, AMX_SIZE, K, sizeof(uint16_t));

	// printf("A: \n");
	// print_imatrix(AT, AMX_SIZE, K, sizeof(uint16_t));

	// printf("B: \n");
	// print_imatrix(B, K, AMX_SIZE, sizeof(uint16_t));

	amx_u16gemm_32x32(AT, B, C, K);
	// printf("C: \n");
	// print_imatrix(C, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	// printf("\n\n");

	gemm_u16(A, B, golden, AMX_SIZE, K, AMX_SIZE);
	// print_imatrix(golden, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	compare_matrix_u32(C, golden, AMX_SIZE, AMX_SIZE);
	// printf("Comparison: \n");
	// print_imatrix(golden, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));

	free(A);
	free(B);
	free(C);
	free(golden);
	return 0;
}