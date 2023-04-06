#pragma once

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "amx.h"

void print_imatrix(void * buf, int M, int N, size_t size) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			switch (size) {
				case sizeof(uint32_t):
					printf("%x  ", ((uint32_t *)buf)[i * N + j]);
					break;

				case sizeof(uint16_t):
					printf("%x  ", ((uint16_t *)buf)[i * N + j]);
					break;

				case sizeof(uint8_t):
					printf("%x  ", ((uint8_t *)buf)[i * N + j]);
					break;
			}
		}
		printf("\n");
	}
}

void amx_get_z(uint32_t * buf, int M, int N) {
	for (uint8_t row = 0; row < M; row++) {
		uint64_t mask = LDSTZ_PAIR | (uint64_t)LDSTZ_Z_ROW(row) | (uint64_t)&buf[row * N];
		AMX_STZ(mask);
	}
}

void set_random_matrix_u16(uint16_t * buf, int M, int N) {
	srand(time(NULL));
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			buf[i * N + j] = rand();
		}
	}
}

void set_random_vector_u16(uint16_t * buf, int M) {
	srand(time(NULL));
	for (int i = 0; i < M; i++) {
		buf[i] = rand();
	}
}

void set_matrix_u16(uint16_t * buf, int M, int N, uint16_t val) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			buf[i * N + j] = val;
		}
	}
}

void set_vector_u16(uint16_t * buf, int M, uint16_t val) {
	for (int i = 0; i < M; i++) {
		buf[i] = val;
	}
}

void set_eye_matrix_u16(uint16_t * buf, int M, int N) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			if (i == j)
				buf[i * N + j] = 1;
			else
				buf[i * N + j] = 0;
		}
	}
}

void gemm_u16(const uint16_t * A, const uint16_t * B, uint32_t * C, int M, int K, int N) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			for (int k = 0; k < K; k++) {
				C[i * N + j] += A[i * K + k] * B[k * N + j];
			}
		}
	}
}

// B will be overwritten with 0 or 1
int compare_matrix_u32(const uint32_t * A, uint32_t * B, int M, int N) {
	int all = 1;
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			B[i * N + j] = A[i * N + j] == B[i * N + j];
			
			if (A[i * N + j] != B[i * N + j])
				all = 0;
		}
	}

	return all;
}

void matrix_transpose(const void * A, void * AT, int M, int N, size_t size) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			switch (size) {
				case sizeof(uint32_t):
					memcpy((void*)(&((uint32_t*)AT)[j * M + i]), (void*)(&((uint32_t*)A)[i * N + j]), size);
					break;

				case sizeof(uint16_t):
					memcpy((void*)(&((uint16_t*)AT)[j * M + i]), (void*)(&((uint16_t*)A)[i * N + j]), size);
					break;

				case sizeof(uint8_t):
					memcpy((void*)(&((uint8_t*)AT)[j * M + i]), (void*)(&((uint8_t*)A)[i * N + j]), size);
					break;
			}
		}
	}
}