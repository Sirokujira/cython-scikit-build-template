.PHONY: init clear rebuild purge test lint lab ipython

init: purge
	virtualenv -p python3 env
	env/bin/pip install .[all]

clear:
	-env/bin/pip uninstall -y temp
	-@rm -rf MANIFEST
	-@rm -rf .pytest_cache tests/__pycache__ __pycache__ _skbuild dist .coverage
	-@find . -type d -name '*.egg-info' | xargs rm -r
	-@find . -type f -name '*.pyc' | xargs rm -r
	-@find . -type d -name '*.ipynb_checkpoints' | xargs rm -r

rebuild: clear
	env/bin/pip install .[all]

purge: clear
	-@rm -rf env

test:
	env/bin/pytest tests/* --cov=temp --cov-report term-missing --durations=10

lint:
	flake8 src/temp setup.py tests

lab:
	env/bin/pip install jupyterlab
	env/bin/jupyter lab

ipython:
	env/bin/pip install ipython
	env/bin/ipython


