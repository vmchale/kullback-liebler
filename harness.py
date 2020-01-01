import timeit

setup_fut = """
import information

mod = information.information()

import numpy as np

pre_normal0 = np.random.random_sample((10000000,))
pre_normal1 = np.random.random_sample((10000000,))

normal0 = pre_normal0 / np.sum(pre_normal0)
normal1 = pre_normal1 / np.sum(pre_normal1)
"""

print('Entropy (Futhark)', timeit.timeit('mod.entropy_f64(normal0)', setup=setup_fut, number=100) * 10, "ms")
print('Scaled entropy (Futhark)', timeit.timeit('mod.entropy_scaled_f64(pre_normal0)', setup=setup_fut, number=100) * 10, "ms")
print('Kullback-Liebler (Futhark)', timeit.timeit('mod.kullback_liebler_f64(normal0, normal1)', setup=setup_fut, number=100) * 10, "ms")
print('Scaled K-L divergence (Futhark)', timeit.timeit('mod.kullback_liebler_scaled_f64(pre_normal0, pre_normal1)', setup=setup_fut, number=100) * 10, "ms")

setup_scipy = """
from scipy.stats import entropy

import numpy as np

pre_normal0 = np.random.random_sample((10000000,))
pre_normal1 = np.random.random_sample((10000000,))

normal0 = pre_normal0 / np.sum(pre_normal0)
normal1 = pre_normal1 / np.sum(pre_normal1)
"""

print('Entropy (scipy)', timeit.timeit('entropy(pre_normal0)', setup=setup_scipy, number=100) * 10, "ms")
print('Kullback-Liebler (scipy)', timeit.timeit('entropy(pre_normal0, pre_normal1)', setup=setup_scipy, number=100) * 10, "ms")
