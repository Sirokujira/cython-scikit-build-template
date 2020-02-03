export PACKAGENAME=scikit-build-template
export SOURCENAME=temp
sudo rm ${SOURCENAME}/*.pyd
sudo rm cythonize.json
sudo rm -rf build
sudo rm -rf dist
sudo rm -rf ${PACKAGENAME}.egg-info
sudo rm -rf .eggs
sudo pip uninstall ${PACKAGENAME} -y
