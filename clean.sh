#!/bin/bash
PACKAGENAME=scikit-build-template
PACKAGENAME2="${PACKAGENAME//-/_}"
echo ${PACKAGENAME2}
SOURCENAME=temp
rm -rf ${SOURCENAME}/*.pyc
rm -rf ${SOURCENAME}/*.so
rm -rf cythonize.json
rm -rf _skbuild
rm -rf dist
rm -rf ${PACKAGENAME2}.egg-info
rm -rf .eggs
pip uninstall ${PACKAGENAME} -y
