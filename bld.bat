REM before install package
pip install -r requirements.txt
REM build source code
REM develop?(build NG)
REM $ pip install -e .
REM release?
python setup.py build_ext -i
python setup.py install
REM generate package
REM python setup.py bdist_wheel
REM api document update from SourceCode
REM sphinx-apidoc -F -o docs/source/reference temp
REM and remove _build, _static, _templates, conf.py, make.bat, Makefile
REM Linux/Mac
REM rmdir /s /q docs/source/reference/_build
REM rmdir /s /q docs/source/reference/_static
REM rmdir /s /q docs/source/reference/_templates
REM Windows
REM del /Q docs/source/reference/conf.py
REM del /Q docs/source/reference/make.bat
REM del /Q docs/source/reference/Makefile
REM check test
REM $ python setup.py test
REM nose doc : https://nose.readthedocs.io/en/latest/plugins/cover.html
REM Check Coverage
nosetests --with-coverage --cover-package=template