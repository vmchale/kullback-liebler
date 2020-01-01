import timeit

setup_fut = """
import numpy as np
import information

mod = information.information()

pre_normal0 = np.random.random_sample((10000000,))
pre_normal1 = np.random.random_sample((10000000,))

normal0 = pre_normal0 / np.sum(pre_normal0)
normal1 = pre_normal1 / np.sum(pre_normal1)
"""

print(timeit.timeit('mod.entropy_f64(normal0)', setup=setup_fut, number=100) * 10, "ms")

setup_scipy = """
from scipy.stats import entropy

import numpy as np

pre_normal0 = np.random.random_sample((10000000,))

normal0 = pre_normal0 / np.sum(pre_normal0)
"""

print(timeit.timeit('entropy(normal0)', setup=setup_scipy, number=100) * 10, "ms")
