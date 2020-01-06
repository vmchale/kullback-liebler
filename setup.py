from setuptools import setup

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(name='entropy-gpu',
      version='0.1.0',
      description='Entropy and K-L divergence on GPU via PyOpenCL',
      long_description=long_description,
      long_description_content_type="text/markdown",
      url='http://github.com/vmchale/phash-fut',
      author='vmchale',
      author_email='vamchale@gmail.com',
      license='BSD3',
      packages=['entropy-gpu'],
      install_requires=['numpy', 'pyopencl'],
      zip_safe=True)
