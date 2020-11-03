#! /usr/bin/env python3
# -*- coding: utf-8 -*-
from __future__ import print_function
# This line replaces 'from setuptools import setup'
from skbuild import setup
from setuptools import find_packages
# from skbuild.cmaker import get_cmake_version
# from skbuild.exceptions import SKBuildError
# from packaging.version import LegacyVersion
# from distutils.version import LooseVersion
import platform

# from ctypes.util import find_library
setup_requires = [
    'setuptools_scm',
]
install_requires = [
    'filelock',
    'nose2',
    'numpy',
    'Cython',
]

MOD_NAMES = [
    'pi_calculator',
    'rect',
]

if platform.system() == 'Windows':
    # https://stackoverflow.com/questions/31262342/cmake-g-ninja-on-windows-specify-x64
    # CMAKE_ARGS=['-DCMAKE_C_COMPILER=cl.exe', '-DCMAKE_CXX_COMPILER=cl.exe', '-DMSVC_TOOLSET_VERSION=140']
    CMAKE_ARGS = ['-DCMAKE_C_COMPILER=cl.exe', '-DCMAKE_CXX_COMPILER=cl.exe']
elif platform.system() == 'Darwin':
    CMAKE_ARGS = ['-DCMAKE_C_COMPILER=clang', '-DCMAKE_CXX_COMPILER=clang++']
else:
    CMAKE_ARGS = ['-DCMAKE_C_COMPILER=gcc', '-DCMAKE_CXX_COMPILER=g++']

setup(
      name='scikit_build_template',
      # name='temp',
      description='cython cmake template modules',
      url='https://github.com/Sirokujira/cython-scikit-build-template',
      version='0.0.1.dev2',
      # check github tag version
      use_scm_version=False,
      setup_requires=setup_requires,
      author='Tooru Oonuma',
      author_email='t753github@gmail.com',
      maintainer='Tooru Oonuma',
      maintainer_email='t753github@gmail.com',
      license='MIT',
      cmake_args=CMAKE_ARGS,
      packages=find_packages(
          'src',
          exclude=["*.tests", "*.tests.*", "tests.*", "tests"],
      ),
      zip_safe=False,
      # The extra '/' was *only* added to check that scikit-build can handle it.
      # package_dir={'scikit-build-template': 'src/'},
      package_dir={'': 'src'},
      install_requires=install_requires,
      classifiers=[
          'License :: OSI Approved :: MIT License',
          'Programming Language :: Python',
          'Programming Language :: Python :: 2.7',
          'Programming Language :: Python :: 3',
          'Programming Language :: Python :: 3.5',
          'Programming Language :: Python :: 3.6',
          'Programming Language :: Python :: 3.7',
          'Programming Language :: Python :: 3.8',
          'Programming Language :: Python :: Implementation :: CPython',
          'Programming Language :: Python :: Implementation :: PyPy'
      ],
      # use nose2
      tests_require=['mock', 'nose'],
      test_suite='nose2.collector.collector',
      # use pytest?
      # tests_require=['pytest'],
      # test_suite='tests'
      )
