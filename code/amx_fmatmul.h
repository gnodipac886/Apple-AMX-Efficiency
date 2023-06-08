#pragma once

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "amx.h"

void print_fpmatrix(void * buf, int M, int N, size_t size) {
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            switch (size) {
                case sizeof(float):
                    printf("%.3f  ", ((float *)buf)[i * N + j]);
                    break;

                case sizeof(double):
                    printf("%.3f  ", ((double *)buf)[i * N + j]);
                    break;
            }
        }
        printf("\n");
    }
}

void set_random_matrix_fp32(float * buf, int M, int N) {
	srand(time(NULL));
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			buf[i * N + j] = rand();
		}
	}
}

void set_random_vector_fp32(float * buf, int M) {
	srand(time(NULL));
	for (int i = 0; i < M; i++) {
		buf[i] = rand();
	}
}

void set_matrix_fp32(float * buf, int M, int N, float val) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			buf[i * N + j] = val;
		}
	}
}

void set_vector_fp32(float * buf, int M, float val) {
	for (int i = 0; i < M; i++) {
		buf[i] = val;
	}
}

void set_eye_matrix_fp32(float * buf, int M, int N) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			if (i == j)
				buf[i * N + j] = 1;
			else
				buf[i * N + j] = 0;
		}
	}
}

void gemm_fp32(const float * A, const float * B, float * C, int M, int K, int N) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			for (int k = 0; k < K; k++) {
				C[i * N + j] += A[i * K + k] * B[k * N + j];
			}
		}
	}
}

// B will be overwritten with 0 or 1
int compare_matrix_fp32(const float * A, float * B, int M, int N) {
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

void matrix_transpose_fp32(const void * A, void * AT, int M, int N, size_t size) {
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < N; j++) {
			switch (size) {
				case sizeof(float):
					memcpy((void*)(&((float*)AT)[j * M + i]), (void*)(&((float*)A)[i * N + j]), size);
					break;

				case sizeof(double):
					memcpy((void*)(&((double*)AT)[j * M + i]), (void*)(&((double*)A)[i * N + j]), size);
					break;
			}
		}
	}
}
