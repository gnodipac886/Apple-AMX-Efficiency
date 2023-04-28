#pragma once
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

// 32 x 32 of 16 bit
#define AMX_SIZE 		32
#define AMX_XY_NUM_REG	8
#define AMX_XY_REG_SIZE	64
#define AMX_Z_REG_SIZE	64
#define AMX_Z_NUM_REG	64
#define AMX_Z_ROW_SIZE	128
#define AMX_ALIGN_128	128

#define AMX_NOP_OP_IMM5(op, imm5) \
	__asm("nop\nnop\nnop\n.word (0x201000 + (%0 << 5) + %1)" : : "i"(op), "i"(imm5) : "memory")

#define AMX_OP_GPR(op, gpr) \
	__asm(".word (0x201000 + (%0 << 5) + 0%1 - ((0%1 >> 4) * 6))" : : "i"(op), "r"((uint64_t)(gpr)) : "memory")

#define MASK(bit) \
	((uint64_t)1 << bit)

#define ALL_ONE_MASK(bit) \
	(((uint64_t)1 << bit) - 1)

#define SHIFT_DATA(data, num_bits, bit_pos) \
	(((uint64_t)(data) & (ALL_ONE_MASK((num_bits)))) << (bit_pos))

#define AMX_LDX(gpr)    			AMX_OP_GPR( 0, gpr)
#define AMX_LDY(gpr)    			AMX_OP_GPR( 1, gpr)
#define AMX_STX(gpr)    			AMX_OP_GPR( 2, gpr)
#define AMX_STY(gpr)    			AMX_OP_GPR( 3, gpr)
#define AMX_LDZ(gpr)    			AMX_OP_GPR( 4, gpr)
#define AMX_STZ(gpr)    			AMX_OP_GPR( 5, gpr)
#define AMX_LDZI(gpr)   			AMX_OP_GPR( 6, gpr)
#define AMX_STZI(gpr)   			AMX_OP_GPR( 7, gpr)
#define AMX_EXTRX(gpr)  			AMX_OP_GPR( 8, gpr)
#define AMX_EXTRY(gpr)  			AMX_OP_GPR( 9, gpr)
#define AMX_FMA64(gpr)  			AMX_OP_GPR(10, gpr)
#define AMX_FMS64(gpr)  			AMX_OP_GPR(11, gpr)
#define AMX_FMA32(gpr)  			AMX_OP_GPR(12, gpr)
#define AMX_FMS32(gpr)  			AMX_OP_GPR(13, gpr)
#define AMX_MAC16(gpr)  			AMX_OP_GPR(14, gpr)
#define AMX_FMA16(gpr)  			AMX_OP_GPR(15, gpr)
#define AMX_FMS16(gpr)  			AMX_OP_GPR(16, gpr)
#define AMX_SET()       			AMX_NOP_OP_IMM5(17, 0)
#define AMX_CLR()       			AMX_NOP_OP_IMM5(17, 1)
#define AMX_VECINT(gpr) 			AMX_OP_GPR(18, gpr)
#define AMX_VECFP(gpr)  			AMX_OP_GPR(19, gpr)
#define AMX_MATINT(gpr) 			AMX_OP_GPR(20, gpr)
#define AMX_MATFP(gpr)  			AMX_OP_GPR(21, gpr)
#define AMX_GENLUT(gpr) 			AMX_OP_GPR(22, gpr)

// ldz stz
#define LDSTZ_Z_ROW(row)			SHIFT_DATA((row), 6, 56)
#define LDSTZ_PAIR					MASK(62)

// ldxy
#define LDXY_MULT_REG				MASK(62)
#define LDXY_REG_IDX(idx)			SHIFT_DATA(idx, 3, 56)

// stxy
#define STXY_MULT_REG				MASK(62)
#define STXY_REG_IDX(idx)			SHIFT_DATA(idx, 3, 56)

// mac16 gpr
#define MAC_16_VTR_MTRX				MASK(63)
#define MAC_16_Z_i32_i16			MASK(62)
#define MAC_16_X_i8_i16				MASK(61)
#define MAC_16_Y_i8_i16				MASK(60)
#define MAC_16_R_SHFT(amt)			SHIFT_DATA(shft_amt, 5, 55)
#define MAC_16_X_ENABLE_MODE(mode)	SHIFT_DATA(mode, 2, 46)
#define MAC_16_X_ENABLE_VAL(val)	SHIFT_DATA(val, 5, 41)
#define MAC_16_Y_ENABLE_MODE(mode)	SHIFT_DATA(mode, 2, 37)
#define MAC_16_Y_ENABLE_VAL(val)	SHIFT_DATA(val, 5, 32)
#define MAC_16_SKIP_X				MASK(29)
#define MAC_16_SKIP_Y				MASK(28)
#define MAC_16_SKIP_Z				MASK(27)
#define MAC_16_Z_ROW(row)			SHIFT_DATA(row, 6, 20)
#define MAC_16_X_OFFSET(off)		SHIFT_DATA(off, 9, 10)
#define MAC_16_Y_OFFSET(off)		SHIFT_DATA(off, 9, 0)

// float32 gpr
#define FP32_REG_IDX(idx)			SHIFT_DATA(idx, 3, 49)
#define FP32_ALU_MODE(mode)			SHIFT_DATA(mode, 6, 47)
#define FP32_LANE_WIDTH_MODE(mode)	SHIFT_DATA(mode, 4, 42)
#define FP32_X_ENABLE_MODE(mode)	SHIFT_DATA(mode, 3, 38)
#define FP32_X_ENABLE_VAL(val)		SHIFT_DATA(val, 5, 32)
#define FP32_Y_ENABLE_MODE(mode)	SHIFT_DATA(mode, 3, 23)
#define FP32_Y_ENABLE_VAL(val)		SHIFT_DATA(val, 6, 57)
#define FP32_Z_ROW(row)				SHIFT_DATA(row, 6, 20)
#define FP32_X_OFFSET(off)			SHIFT_DATA(off, 9, 10)
#define FP32_Y_OFFSET(off)			SHIFT_DATA(off, 9, 0)

typedef enum {
	AMX_X_REG,
	AMX_Y_REG,
	AMX_Z_REG
} amx_reg_e;

typedef struct amx_xy_reg {
	uint8_t reg[AMX_XY_REG_SIZE];
} amx_xy_reg_t;

typedef struct amx_xy_8_reg {
	amx_xy_reg_t reg[AMX_XY_NUM_REG];
} __attribute__ ((aligned (AMX_ALIGN_128))) amx_xy_8_reg_t;

typedef struct amx_z_reg {
	uint32_t val[AMX_SIZE * AMX_SIZE];
} __attribute__ ((aligned (AMX_ALIGN_128))) amx_z_reg_t;

amx_xy_8_reg_t 	amx_x_reg;
amx_xy_8_reg_t 	amx_y_reg;
amx_z_reg_t		amx_z_reg;

int amx_started = 0;

void _amx_set(void) {
	// if (!amx_started)
	AMX_SET();
}

void _amx_clr(void) {
	// if (amx_started) {
	AMX_CLR();
		// amx_started = 0;
	// }
}

void _amx_ldx	(void * ptr) {AMX_LDX(ptr);}
void _amx_ldy	(void * ptr) {AMX_LDY(ptr);}
void _amx_stx	(void * ptr) {AMX_STX(ptr);}
void _amx_sty	(void * ptr) {AMX_STY(ptr);}
void _amx_ldz	(void * ptr) {AMX_LDZ(ptr);}
void _amx_stz	(void * ptr) {AMX_STZ(ptr);}
void _amx_ldzi	(void * ptr) {AMX_LDZI(ptr);}
void _amx_stzi	(void * ptr) {AMX_STZI(ptr);}
void _amx_extrx	(void * ptr) {AMX_EXTRX(ptr);}
void _amx_extry	(void * ptr) {AMX_EXTRY(ptr);}
void _amx_fma64	(void * ptr) {AMX_FMA64(ptr);}
void _amx_fms64	(void * ptr) {AMX_FMS64(ptr);}
void _amx_fma32	(void * ptr) {AMX_FMA32(ptr);}
void _amx_fms32	(void * ptr) {AMX_FMS32(ptr);}
void _amx_mac16	(void * ptr) {AMX_MAC16(ptr);}
void _amx_fma16	(void * ptr) {AMX_FMA16(ptr);}
void _amx_fms16	(void * ptr) {AMX_FMS16(ptr);}
void _amx_vecint(void * ptr) {AMX_VECINT(ptr);}
void _amx_vecfp	(void * ptr) {AMX_VECFP(ptr);}
void _amx_matint(void * ptr) {AMX_MATINT(ptr);}
void _amx_matfp	(void * ptr) {AMX_MATFP(ptr);}
void _amx_genlut(void * ptr) {AMX_GENLUT(ptr);}

void _amx_ldx_align	(void * ptr, size_t size) {
	void * aligned_ptr = aligned_alloc(AMX_ALIGN_128, size);
	memcpy(aligned_ptr, ptr, size);
	AMX_LDX(ptr);
	free(aligned_ptr);
}

void _amx_ldy_align	(void * ptr, size_t size) {
	void * aligned_ptr = aligned_alloc(AMX_ALIGN_128, size);
	memcpy(aligned_ptr, ptr, size);
	AMX_LDY(ptr);
	free(aligned_ptr);
}

void amx_store_z(uint32_t * buf, int interleave_cols, int condense_rows) {
	uint32_t * temp = (uint32_t *)aligned_alloc(AMX_ALIGN_128, AMX_Z_ROW_SIZE * AMX_SIZE);
	for (uint8_t row = 0; row < AMX_SIZE; row++) {
		// printf("\n%d\n", row);
		uint64_t mask = LDSTZ_PAIR | (uint64_t)LDSTZ_Z_ROW(row*2) | (uint64_t)(&(temp[row * AMX_SIZE]));
		AMX_STZ(mask);
	}

	// interleave the registers
	if (interleave_cols) {
		for (uint8_t row = 0; row < AMX_SIZE; row++) {
			for (int i = 0; i < AMX_SIZE/2; i++) {
				buf[row * AMX_SIZE + (i<<1)] 		= temp[row * AMX_SIZE + i];
				buf[row * AMX_SIZE + (i<<1) + 1] 	= temp[row * AMX_SIZE + (AMX_SIZE>>1) + i];
			}
		}
	} 
	
	if (condense_rows) {
		for (int i = 0; i < AMX_Z_NUM_REG / condense_rows; i++) {
			memcpy(&(((uint8_t*)buf)[i * AMX_Z_REG_SIZE]), &(((uint8_t*)temp)[(i * condense_rows) * AMX_Z_REG_SIZE]), AMX_Z_ROW_SIZE * AMX_SIZE);
		}
	}
	free(temp);
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
