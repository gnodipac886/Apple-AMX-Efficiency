CXX=gcc-13
CFLAGS=
MPI_FLAGS=-pthread -L/opt/homebrew/Cellar/open-mpi/4.1.5/lib -lmpi -I/opt/homebrew/Cellar/open-mpi/4.1.5/include
CYTHON_FLAGS=-fPIC -shared
POWER_FLAGS=-O3 -D_BSD_SOURCE -fopenmp

all: main
	$(CXX) $(CFLAGS) main.c -o main

cython:
	$(CXX) $(CYTHON_FLAGS) amx_cython.c -o amx.so

cython_run:
	$(CXX) $(CFLAGS) amx_cython.c -o main

power_raw_asm:
	$(CXX) $(POWER_FLAGS) $(MPI_FLAGS) -DAMX_RAW amx_power.c -S -o amx_power.S

power_raw:
	$(CXX) $(POWER_FLAGS) $(MPI_FLAGS) -DAMX_RAW amx_power.c -o amx_power

power_ld:
	$(CXX) $(POWER_FLAGS) $(MPI_FLAGS) -DAMX_LD amx_power.c -o amx_power

power_ld_flush:
	$(CXX) $(POWER_FLAGS) -DAMX_LD_FLUSH amx_power.c -o amx_power

power_ldst:
	$(CXX) $(POWER_FLAGS) $(MPI_FLAGS) -DAMX_LDST amx_power.c -o amx_power

power_ldst_flush:
	$(CXX) $(POWER_FLAGS) -DAMX_LDST_FLUSH amx_power.c -o amx_power

cpu_power:
	$(CXX) -O1 -fopenmp $(MPI_FLAGS) cpu_power.c -o cpu_power

clean:
	rm -f amx.so main power cpu_power