#include "amx_fp32.h"
#include "amx.h"
#include <mpi.h>
#include <omp.h>
#include <stdlib.h>
#include <pthread/qos.h>

#define FLUSH(ptr) __asm("DC CVAC, %[value]" : : [value]"r" (ptr) :)

#define INT_RAW(ldx_mask, mac_mask) AMX_MAC16(mac_mask);

// #define FP_RAW(ldx_mask, mac_mask) 	INT_RAW(ldx_mask, mac_mask) // AMX_MATFP(mac_mask); //
#define FP_RAW(ldx_mask, mac_mask) 	AMX_MATFP(mac_mask);

#define FP_LDS(ldx_mask, mac_mask) 	AMX_LDX(ldx_mask);\
									AMX_LDY(ldx_mask);\
									FP_RAW(ldx_mask, mac_mask);

#define FP_LDS_FLUSH(ldx_mask, mac_mask) FLUSH(ldx_mask & ALL_ONE_MASK(56));\
									AMX_LDX(ldx_mask);\
									FLUSH(ldx_mask & ALL_ONE_MASK(56));\
									AMX_LDY(ldx_mask);\
									FP_RAW(ldx_mask, mac_mask);

#define FP_LDST(ldx_mask, mac_mask) FP_LDS(ldx_mask, mac_mask)

#define FP_LDST_FLUSH(ldx_mask, mac_mask) FP_LDS_FLUSH(ldx_mask, mac_mask) \
									for (uint8_t row = 0; row < AMX_SIZE; row++) { \
										uint64_t mask = LDSTZ_PAIR | (uint64_t)LDSTZ_Z_ROW(row*2) | (uint64_t)(&(((uint32_t*)&amx_z_reg)[row * AMX_SIZE])); \
										FLUSH(&((uint32_t*)&amx_z_reg)[row * AMX_SIZE]);\
										AMX_STZ(mask); \
									}

#ifdef AMX_LD
	#define INSTR(ldx_mask, mac_mask) FP_LDS(ldx_mask, mac_mask)
#endif

#ifdef AMX_LD_FLUSH
	#define INSTR(ldx_mask, mac_mask) FP_LDS_FLUSH(ldx_mask, mac_mask)
#endif

#ifdef AMX_LDST
	#define INSTR(ldx_mask, mac_mask) FP_LDST(ldx_mask, mac_mask)
#endif

#ifdef AMX_LDST_FLUSH
	#define INSTR(ldx_mask, mac_mask) FP_LDST_FLUSH(ldx_mask, mac_mask)
#endif

#ifdef AMX_RAW
	#define INSTR(ldx_mask, mac_mask) FP_RAW(ldx_mask, mac_mask)
#endif

int iter = 0;
int stop = 0;
int rank;

int amx_raw_thread(int sleep) {
	uint64_t mac_mask = FP32_LANE_WIDTH_MODE(4) | FP32_X_OFFSET(0 * AMX_XY_REG_SIZE) | FP32_Y_OFFSET(0 * AMX_XY_REG_SIZE);
	uint64_t ld_mask = LDXY_REG_IDX(0) | (uint64_t)(&amx_x_reg);
	uint64_t u16_mac_mask =  MAC_16_X_OFFSET(0 * AMX_XY_REG_SIZE) | MAC_16_Y_OFFSET(0 * AMX_XY_REG_SIZE) | MAC_16_Z_i32_i16;
	_amx_set();
	usleep(sleep * 1000000);
	while (!stop) {
		for (int i = 0; i < 10000; i++) {
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);

			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			INSTR(ld_mask, mac_mask);
			#ifdef AMX_LDST
			for (uint8_t row = 0; row < AMX_SIZE; row++) {
				uint64_t mask = LDSTZ_PAIR | (uint64_t)LDSTZ_Z_ROW(row*2) | (uint64_t)(&(((uint32_t*)&amx_z_reg)[row * AMX_SIZE]));
				AMX_STZ(mask);
			}
			#endif
		}
		iter++;
	}
	_amx_clr();
	return iter;
}

void power_thread(int interval, int seconds) {
	int samples = seconds * 1000 / interval;
	char str[100];
	sprintf(str, "sudo powermetrics -i %d -n %d --show-process-energy --hide-cpu-duty-cycle > power.txt &", interval, samples);
	system(str);
	usleep((seconds+2) * 1000000);
	system("sudo killall powermetrics");
	printf("Process %d: iter: %d\n", rank, iter);
	// system("sudo killall amx_power");
	// exit(0);
	stop = 1;
	// MPI_Abort(MPI_COMM_WORLD, 0);
	MPI_Bcast(&stop, 1, MPI_INT, 0, MPI_COMM_WORLD);
}

void recv_thread() {
	MPI_Bcast(&stop, 1, MPI_INT, 0, MPI_COMM_WORLD);
	printf("Process %d: iter: %d\n", rank, iter);
	// MPI_Recv(&stop, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE)
}

int main(int argc, char * argv[]) {
	// int e = pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0);
	// fprintf(stderr, "Pthread error: %d\n", e);
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
		// if (argc > 2)
		// 	power_thread(atoi(argv[1]), atoi(argv[2]));
		#pragma omp parallel num_threads(2) 
		{
			if (argc > 2 && omp_get_thread_num() == 0)
				power_thread(atoi(argv[1]), atoi(argv[2]));
			else {
				int iter = amx_raw_thread(atoi(argv[3]));
			}
		}
	} else {
		// #pragma omp parallel num_threads(2) 
		// {
			// if (argc > 2 && omp_get_thread_num() == 0)
			// 	recv_thread();
			// else {
				int iter = amx_raw_thread(atoi(argv[3]));
			// }
		// }
	}

	MPI_Finalize();
}