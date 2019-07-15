#include <stdlib.h>
#include <memory.h>

#include <benchmark/benchmark.h>

static void BM_benchmarkMalloc(benchmark::State& state) {
   char* p;
   while (state.KeepRunning()) {
      p = (char*) malloc(384);
      memset(p, 0xfefe, 384);
      free(p);
   }
}
BENCHMARK(BM_benchmarkMalloc);
BENCHMARK(BM_benchmarkMalloc)->Threads(2);

BENCHMARK_MAIN();
