# futhark-kullback-liebler

The Kullback-Liebler divergence in Futhark

## Benchmarks

To run the benchmarks:

```
make
pipenv run python harness.py
```

and

```
futhark bench information.fut --backend opencl --runs=100
```

### Comparison

| Computation | Array Size | Implementation | Time |
| ----------- | ---------- | -------------- | ---- |
| Entropy | 10000000 | Futhark | 27.41 ms |
| Kullback-Liebler Divergence | 10000000 | Futhark | 19.61 ms |
| Entropy | 10000000 | Python + Futhark | 52.80 ms |
| Kullback-Liebler Divergence | 10000000 | Python + Futhark | 94.07 ms |
| Entropy | 10000000 | Python (SciPy) | 233.45 ms |
| Kullback-Liebler Divergence | 10000000 | Python (SciPy) | 340.83 ms |
| Entropy | 10000000 | J | 227.37 ms |
