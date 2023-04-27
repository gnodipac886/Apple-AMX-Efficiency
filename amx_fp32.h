#pragma once

#include "amx.h"
#include "amx_fmatmul.h"

void amx_fp32_dump_x_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STX(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX x reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE/2; i++) {
		printf("%.3f ", ((float*)temp)[i]);
	}
	printf("\n");
}

void amx_fp32_dump_y_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STY(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX y reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE/2; i++) {
		printf("%.3f ", ((float*)temp)[i]);
	}
	printf("\n");
}

void _amx_fp32_dump_z_reg() {
	// amx_z_reg_t temp;
	float * ptr = (float *)aligned_alloc(AMX_ALIGN_128, AMX_Z_ROW_SIZE * AMX_SIZE);

	printf("Dumping AMX z reg: \n");
	amx_store_z((uint32_t*)ptr, 0, 4);
	print_fpmatrix(ptr, AMX_SIZE/2, AMX_SIZE/2, sizeof(float));
	printf("DONE PRINTING\n");
	free(ptr);
}

void amx_perform_n_fouter_product(int n, uint64_t mask) {
	// perform n macs
	for (int i = 0; i < n; i++) {
		// amx_fp32_dump_x_reg(i);
		// amx_fp32_dump_y_reg(i);

		// make mac mask, set xy register offset, set z to i32 bit mode
		uint64_t mac_mask = FP32_LANE_WIDTH_MODE(4) | FP32_X_OFFSET(i * AMX_XY_REG_SIZE) | FP32_Y_OFFSET(i * AMX_XY_REG_SIZE) | mask;
		AMX_MATFP(mac_mask);
		// _amx_fp32_dump_z_reg();
	}

	// printf("Performed %.3f outer products\n", n);
}

// A num cols = B num rows = K
void amx_fp32_gemm_16x16(const float * A, const float * B, float * C, int K) {
	// start AMX
	// _amx_set();

	for (int k = 0; k < K; k+=AMX_XY_NUM_REG) {
		int num_regs = (K - k) > AMX_XY_NUM_REG ? AMX_XY_NUM_REG : (K - k);
		amx_load_xy_reg((void*)&(((uint8_t*)A)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_Y_REG, 0);
		// print_fpmatrix((void*)&(((uint8_t*)A)[k * AMX_XY_REG_SIZE]), num_regs, AMX_XY_REG_SIZE / sizeof(float), sizeof(float));
		amx_load_xy_reg((void*)&(((uint8_t*)B)[k * AMX_XY_REG_SIZE]), 0, num_regs, AMX_X_REG, 0);
		// print_fpmatrix((void*)&(((uint8_t*)B)[k * AMX_XY_REG_SIZE]), num_regs, AMX_XY_REG_SIZE / sizeof(float), sizeof(float));

		amx_perform_n_fouter_product(num_regs, 0);
		// printf("%.3f num reg\n", num_regs);
	}

	// get the result back
	amx_store_z((uint32_t*)&amx_z_reg, 0, 4);
	_amx_fp32_dump_z_reg();
	memcpy(C, &amx_z_reg, (AMX_SIZE/2)*(AMX_SIZE/2)*sizeof(float));

	// end AMX
	// _amx_clr();
}
