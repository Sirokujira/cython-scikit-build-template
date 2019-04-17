# before install package
pip install -r requirements.txt
# build source code
# $ pip install -e .
python setup.py build_ext -i
python setup.py install
# generate package
# $ python setup.py bdist_wheel
# api document update from sourceCode
# and remove _build, _static, _templates, conf.py, make.bat, Makefile
# $ sphinx-apidoc -F -o docs/source/reference src/
# $ rm -rf docs/source/reference/_build
# $ rm -rf docs/source/reference/_static
# $ rm -rf docs/source/reference/_templates
# $ rm docs/source/reference/conf.py
# $ rm docs/source/reference/make.bat
# $ rm docs/source/reference/Makefile
# check test
# $ python setup.py test
# nose doc : https://nose.readthedocs.io/en/latest/plugins/cover.html
nosetests --with-coverage