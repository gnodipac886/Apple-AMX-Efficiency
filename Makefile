CXX=gcc-12
CFLAGS=
CYTHON_FLAGS=-fPIC -shared
POWER_FLAGS=-O3 -fopenmp

all: main
	$(CXX) $(CFLAGS) main.c -o main

cython:
	$(CXX) $(CYTHON_FLAGS) amx_cython.c -o amx.so

cython_run:
	$(CXX) $(CFLAGS) amx_cython.c -o main

power:
	$(CXX) $(POWER_FLAGS) amx_power.c -o amx_power

clean:
	rm -f amx.so main power