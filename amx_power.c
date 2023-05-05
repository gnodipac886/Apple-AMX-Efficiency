#include "amx_fp32.h"
#include "amx.h"
#include <omp.h>
#include <stdlib.h>

void _amx_set();
void _amx_clr();

void amx_raw_thread(int sleep) {
	uint64_t mac_mask = FP32_LANE_WIDTH_MODE(4) | FP32_X_OFFSET(0 * AMX_XY_REG_SIZE) | FP32_Y_OFFSET(0 * AMX_XY_REG_SIZE);
	
	_amx_set();
	usleep(sleep * 1000000);
	while (1) {
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
		AMX_MATFP(mac_mask);
	}
	_amx_clr();
}

void power_thread(int interval, int seconds) {
	int samples = seconds * 1000 / interval;
	char str[100];
	sprintf(str, "sudo powermetrics -i %d -n %d --show-process-energy --hide-cpu-duty-cycle > power.txt &", interval, samples);
	system(str);
	usleep((seconds+2) * 1000000);
	system("sudo killall powermetrics");
	exit(0);
}

int main(int argc, char * argv[]) {
	#pragma omp parallel num_threads(2) 
	{
		if (omp_get_thread_num() == 0) {
			if (argc > 2)
				power_thread(atoi(argv[1]), atoi(argv[2]));
		}

		if (omp_get_thread_num() == 1) {
			amx_raw_thread(atoi(argv[3]));
		}
	}
}