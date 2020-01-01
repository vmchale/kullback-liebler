# futhark-kullback-liebler

The Kullback-Liebler divergence in Futhark

## Benchmarks

To run the benchmarks:

```
make
python harness.py
```

and

```
futhark bench information.fut --backend opencl --runs=100
```
