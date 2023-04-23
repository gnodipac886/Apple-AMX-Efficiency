CXX=gcc-12
CFLAGS=
CYTHON_FLAGS=-fPIC -shared

all: main
	$(CXX) $(CFLAGS) main.c -o main

cython:
	$(CXX) $(CYTHON_FLAGS) amx_cython.c -o amx.so

cython_run:
	$(CXX) $(CFLAGS) amx_cython.c -o main

clean:
	rm -f amx.so main