#include "amx_imatmul.h"
#include "amx.h"
#include "amx_u16.h"
#include "amx_fp32.h"

int main() {
	int K = 32;
	uint16_t * A 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * AT 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint16_t * B 	= (uint16_t *)malloc(AMX_SIZE * K * sizeof(uint16_t));
	uint32_t * C 	= (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));
	uint32_t * golden = (uint32_t *)malloc(AMX_SIZE * AMX_SIZE * sizeof(uint32_t));

	set_eye_matrix_u16(A, AMX_SIZE, K);
	set_eye_matrix_u16(B, K, AMX_SIZE);
	matrix_transpose(A, AT, AMX_SIZE, K, sizeof(uint16_t));

	amx_u16_gemm_32x32(AT, B, C, K);

	printf("C: \n");
	print_imatrix(C, AMX_SIZE, AMX_SIZE, sizeof(uint32_t));
	
	free(A);
	free(B);
	free(C);
	free(golden);
	return 0;
}