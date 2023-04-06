#pragma once
#include <stdint.h>

int amx_started = 0;

// 32 x 32 of 16 bit
#define AMX_SIZE 		32
#define AMX_XY_NUM_REG	8
#define AMX_XY_REG_SIZE	64
#define AMX_ALIGN_128	128

#define AMX_NOP_OP_IMM5(op, imm5) \
	__asm("nop\nnop\nnop\n.word (0x201000 + (%0 << 5) + %1)" : : "i"(op), "i"(imm5) : "memory")

#define AMX_OP_GPR(op, gpr) \
	__asm(".word (0x201000 + (%0 << 5) + 0%1 - ((0%1 >> 4) * 6))" : : "i"(op), "r"((uint64_t)(gpr)) : "memory")

#define MASK(bit) \
	(uint64_t)1 << bit

#define ALL_ONE_MASK(bit) \
	((uint64_t)1 << bit) - 1

#define SHIFT_DATA(data, num_bits, bit_pos) \
	((uint64_t)data & (ALL_ONE_MASK(num_bits))) << bit_pos

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
#define LDSTZ_Z_ROW(row)			SHIFT_DATA(row, 6, 56)
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

void _amx_set() {
	if (!amx_started)
		AMX_SET();
}

void _amx_clr() {
	if (amx_started)
		AMX_CLR();
}

void _amx_dump_x_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STX(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX x reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE; i++) {
		printf("%d ", ((uint16_t*)temp)[i]);
	}
	printf("\n");
}

void _amx_dump_y_reg(int idx) {
	amx_xy_reg_t temp[2];
	AMX_STY(STXY_REG_IDX(idx) | (uint64_t)temp);

	printf("Dumping AMX y reg[%d]: ", idx);
	for (int i = 0; i < AMX_SIZE; i++) {
		printf("%d ", ((uint16_t*)temp)[i]);
	}
	printf("\n");
}

void _amx_dump_z_reg() {
	amx_z_reg_t temp;

	printf("Dumping AMX z reg: \n");
	for (uint8_t row = 0; row < AMX_SIZE; row++) {
		uint64_t mask = LDSTZ_PAIR | (uint64_t)LDSTZ_Z_ROW(row) | (uint64_t)&((uint32_t*)&temp)[row * AMX_SIZE];
		AMX_STZ(mask);

		for (int i = 0; i < AMX_SIZE; i++) {
			printf("%d  ", ((uint32_t*)&temp)[row * AMX_SIZE + i]);
		}
		printf("\n");
	}
}