#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

void outer_product_mmm(int16_t *C, int16_t const *A, int16_t const *B, int M, int N, int K) {
    for (int i = 0; i < K; i++) {
        for (int j = 0; j < M; j++) {
            for (int k = 0; k < N; k++) {
                C[j * N + k] += A[j * K + i] * B[i * N + k];
            }
        }
    }
}

int main() {
	int16_t * A, * B, * C;
	A = (int16_t*)malloc(16 * 16 * sizeof(int16_t));
	B = (int16_t*)malloc(16 * 16 * sizeof(int16_t));
	C = (int16_t*)malloc(16 * 16 * sizeof(int16_t));
	for (int i = 0; i < 10; i++) {
		outer_product_mmm(C, A, B, 16, 16, 16);
	}
	free(A);
	free(B);
	free(C);
}