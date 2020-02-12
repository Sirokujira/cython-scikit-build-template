export PACKAGENAME=scikit-build-template
export SOURCENAME=temp
sudo rm -rf ${SOURCENAME}/*.so
sudo rm cythonize.json
sudo rm -rf _skbuild
sudo rm -rf dist
sudo rm -rf ${PACKAGENAME}.egg-info
sudo rm -rf .eggs
pip uninstall ${PACKAGENAME} -y
