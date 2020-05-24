# poptim
*P*ython *optim*ize is an attempt to compile Python for modern CPU heavy Python workloads. Ideally, it would work on k8s, would still be secure and users shouldn't recognize it's not the official CPython from the image distribution.

## Benchmarking
* we use [Python Performance Benchmark](https://pyperformance.readthedocs.io/)
* The benchmark is triggered in docker images

### Usage
Assuming you have docker installed. Trigger the benchmark run via `sh bench.sh`. 

After it's finished, use the `pyperf compare_to benchouts/*.json` to compare the results.  Therefore, you need to have `pyperformance` installed (`pip install pyperformance`).

### Notes
* you really need to run docker with `--security-opt seccomp=unconfined`. Without this, the performance penalty is slowing the results up to 2x as much.

### compare_to2csv
To get a nanosecond CSV from the `pyperf compare_to *.json --table > copy-pasted-table.csv`:


```python
notl = [x for x in open('copy-pasted-table.csv').readlines() if not x.startswith('+')]
df = (pd
.DataFrame([[a.strip() for a in x.split('|') if a] for x in notl])
.pipe(lambda _df: _df.rename(columns=_df.iloc[0, :]))
.set_index("Benchmark")
.drop("Benchmark", axis=0)
.pipe(lambda _df: _df.where(lambda x: x != "not significant", _df.iloc[:, 0], axis=0))
.applymap(lambda x: pd.Timedelta(x.split(':')[0]).value)
.iloc[:, :-1]
)
df.to_csv('results.csv')

# df.apply(lambda x: x/df.loc[:, "poptim"]).mul(100).astype(int).to_csv("poptim-relative.csv")
```

# TODO
* `poptim` image is not ready yet to be actually used as a base image, has likely many errors and stuff
* automatic builds and triggers for all images and running the benchmark
