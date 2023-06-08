#pragma once

#include "amx.h"

void amx_u16_dump_x_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STX(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX x reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE; i++) {
		printf("%d ", ((uint16_t*)temp)[i]);
	}
	printf("\n");
}

void amx_u16_dump_y_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STY(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX y reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE; i++) {
		printf("%d ", ((uint16_t*)temp)[i]);
	}
	printf("\n");
}

void _amx_u16_dump_z_reg() {
	// amx_z_reg_t temp;
	uint32_t * temp = (uint32_t *)aligned_alloc(AMX_ALIGN_128, AMX_ALIGN_128 * AMX_SIZE);

	printf("Dumping AMX z reg: \n");
	amx_store_z(temp, 1, 0);
	print_imatrix(temp, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));
	free(temp);
}

void amx_perform_n_iouter_product(int n, uint64_t mask) {
	// perform n macs
	for (int i = 0; i < n; i++) {
		// amx_u16_dump_x_reg(i);
		// amx_u16_dump_y_reg(i);

		// make mac mask, set xy register offset, set z to i32 bit mode
		uint64_t mac_mask =  MAC_16_X_OFFSET(i * AMX_XY_REG_SIZE) | MAC_16_Y_OFFSET(i * AMX_XY_REG_SIZE) | mask;
		AMX_MAC16(mac_mask);
		// _amx_u16_dump_z_reg();
	}

	// printf("Performed %d outer products\n", n);
}

// A num cols = B num rows = K
void amx_u16_gemm_32x32(const uint16_t * A, const uint16_t * B, uint32_t * C, int K) {
	// start AMX
	// _amx_set();

	for (int k = 0; k < K; k+=AMX_XY_NUM_REG) {
		int num_regs = (K - k) > AMX_XY_NUM_REG ? AMX_XY_NUM_REG : (K - k);
		amx_load_xy_reg((void*)&(((uint8_t*)A)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_Y_REG, 0);
		// print_imatrix((void*)&(((uint8_t*)A)[k * AMX_XY_REG_SIZE]), num_regs, AMX_XY_REG_SIZE / sizeof(uint16_t), sizeof(uint16_t));
		amx_load_xy_reg((void*)&(((uint8_t*)B)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_X_REG, 0);
		// print_imatrix((void*)&(((uint8_t*)B)[k * AMX_XY_REG_SIZE]), num_regs, AMX_XY_REG_SIZE / sizeof(uint16_t), sizeof(uint16_t));

		amx_perform_n_iouter_product(num_regs, MAC_16_Z_i32_i16);
		// printf("%d num reg\n", num_regs);
	}

	// get the result back
	amx_store_z((uint32_t*)&amx_z_reg, 1, 0);
	_amx_u16_dump_z_reg();
	memcpy(C, &amx_z_reg, sizeof(amx_z_reg_t));

	// end AMX
	// _amx_clr();
}