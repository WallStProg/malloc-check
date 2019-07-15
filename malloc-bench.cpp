#include <stdlib.h>
#include <string.h>

#include <benchmark/benchmark.h>

static void BM_benchmarkMalloc(benchmark::State& state) {
   std::string x;
   while (state.KeepRunning()) {
      char* p = (char*) malloc(384);
      memset(p, 0xfefe, 384);
      free(p);
   }
}
BENCHMARK(BM_benchmarkMalloc);
BENCHMARK(BM_benchmarkMalloc)->Threads(2);

BENCHMARK_MAIN();
