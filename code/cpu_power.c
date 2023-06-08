#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

int iter = 0;
int stop = 0;

void outer_product_mmm(float *C, float const *A, float const *B, int M, int N, int K) {
    for (int i = 0; i < K; i++) {
        for (int j = 0; j < M; j++) {
            for (int k = 0; k < N; k++) {
                C[j * N + k] += A[j * K + i] * B[i * N + k];
            }
        }
    }
}

int amx_raw_thread(int sleep) {
	usleep(sleep * 1000000);
	float * A, * B, * C;
	A = (float*)malloc(16 * 16 * sizeof(float));
	B = (float*)malloc(16 * 16 * sizeof(float));
	C = (float*)malloc(16 * 16 * sizeof(float));
	while (!stop) {
		for (int i = 0; i < 10000; i++) {
			outer_product_mmm(C, A, B, 16, 16, 16);
		}
		iter++;
	}
	free(A);
	free(B);
	free(C);
	return iter;
}

void power_thread(int interval, int seconds) {
	int samples = seconds * 1000 / interval;
	char str[100];
	sprintf(str, "sudo powermetrics -i %d -n %d --show-process-energy --hide-cpu-duty-cycle > power.txt &", interval, samples);
	system(str);
	usleep((seconds+2) * 1000000);
	system("sudo killall powermetrics");
	printf("Iterations: %d\n", iter);
	// exit(0);
	stop = 1;
}

int main(int argc, char * argv[]) {
	int rank;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
		#pragma omp parallel num_threads(2) 
		{
			if (argc > 2 && omp_get_thread_num() == 0)
				power_thread(atoi(argv[1]), atoi(argv[2]));
			else {
				int iter = amx_raw_thread(atoi(argv[3]));
			}
		}
	}

	MPI_Finalize();
}