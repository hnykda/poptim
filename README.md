# poptim
*P*ython *optim*ize is an attempt to compile Python for modern CPU heavy Python workloads. Ideally, it would work on k8s, would still be secure and users shouldn't recognize it's not the official CPython from the image distribution.

## Benchmarking
* we use [Python Performance Benchmark](https://pyperformance.readthedocs.io/)
* The benchmark is triggered in docker images

### Usage
Assuming you have docker installed. Trigger the benchmark run via `sh bench.sh`. 

After it's finished, use the `pyperf compare_to benchouts/*.json` to compare the results.  Therefore, you need to have `pyperformance` installed (`pip install pyperformance`).

# TODO
* `poptim` image is not ready yet to be actually used as a base image, has likely many errors and stuff
* automatic builds and triggers for all images and running the benchmark
