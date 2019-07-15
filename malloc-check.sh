#!/bin/bash

# get console (tty) messages from glibc on stderr (https://bugzilla.redhat.com/show_bug.cgi?id=1519182)
export LIBC_FATAL_STDERR_=1

# set BENCHMARK_ROOT to location of google benchmark (https://github.com/google/benchmark)
if [[ -n ${BENCHMARK_ROOT} ]]; then
   g++ -O3 -I${BENCHMARK_ROOT}/include -o malloc-bench.o -c malloc-bench.cpp
   g++ malloc-bench.o -o malloc-bench -L${BENCHMARK_ROOT}/lib -lbenchmark -lpthread
fi

gcc -o double-free.o -c double-free.c
gcc double-free.o -o double-free
gcc -o double-free2.o -c double-free2.c
gcc double-free2.o -o double-free2

unset MALLOC_CHECK_
echo "==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=0
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=1
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=2
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=3
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=5
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2

export MALLOC_CHECK_=7
echo -e "\n\n\n==================="
echo "MALLOC_CHECK_=${MALLOC_CHECK_}"
[[ -n ${BENCHMARK_ROOT} ]] && ./malloc-bench
./double-free
./double-free2
