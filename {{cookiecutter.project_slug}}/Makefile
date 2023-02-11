.PHONY: help venv clean clean-build clean-pyc clean-test clean-docs clean-data lint tests tests-basic tests-metrics cov cov-basic docs dist install jupyter pre-commit format
.DEFAULT_GOAL := help

.SILENT: clean-build clean-pyc clean-test clean-docs clean-data

PYTHON=python3
PIP=pip3
POETRY=poetry

export TESTMON_DATAFILE=.testmondata

define PRINT_HELP_PYSCRIPT
import re, sys

targets = []
for line in sys.stdin:
	match = re.match(r'^([a-zA-Z0-9_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		targets.append((target, help))

targets = sorted(targets, key=lambda x: x[0])
for target, help in targets:
    print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT


define HTTP_SERVER_PYSCRIPT
import http.server
import socketserver

DEFAULT_PORT = 8000

for i in range(0, 1000):
    port = DEFAULT_PORT + i

    try:
        Handler = http.server.SimpleHTTPRequestHandler

        with socketserver.TCPServer(("", port), Handler) as httpd:
            print(f"Serving HTTP on 0.0.0.0 port {port} (http://0.0.0.0:{port}/) ...")
            httpd.serve_forever()

    except OSError as exc:
        print(f"{exc} - port {port}")
endef
export HTTP_SERVER_PYSCRIPT


help:
	@$(PYTHON) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

venv: ## Make Python virtual environment
	$(PIP) install --no-cache-dir --upgrade pip
	$(PIP) install --no-cache-dir wheel poetry
	$(POETRY) config virtualenvs.create false
	$(POETRY) config experimental.system-git-client true
	$(POETRY) install --all-extras
	pre-commit install --hook-type pre-commit --hook-type pre-push --hook-type pre-merge-commit

clean: clean-build clean-pyc clean-test clean-docs clean-data ## Remove all build, test, coverage, artifacts and empty data/out

clean-build: ## Remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -fr {} +

clean-pyc: ## Remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## Remove test, coverage and linting artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -f coverage.xml
	rm -fr htmlcov/
	rm -fr .pytest_cache
	rm -fr .mypy_cache
	rm -fr .ipynb_checkpoints
	rm -fr *.log
	rm -fr *.log.*
	rm -f test_result.xml

clean-docs: ## Remove files with make docs
	rm -f docs/source/modules.rst
	rm -f docs/source/readme.md docs/source/release_notes.md
	rm -rf docs/build

clean-data: ## Remove files within data/out
	find data -type f \( ! -name ".gitkeep" \) -exec rm -f {} +
	find data -type d \( ! -wholename "data" \) -exec rm -fr {} +

dist: clean ## Build wheel
	$(POETRY) build -f wheel
	ls -l dist

lint: ## Check style with pylint and flake8
	pylint {{cookiecutter.package_name}}
	flake8 --strictness short --darglint-ignore-regex "^(test_|_?mock|not_test|not__mock|repo)" tests {{cookiecutter.package_name}}
	radon cc {{cookiecutter.package_name}} -a -nc
	radon mi {{cookiecutter.package_name}} -nc

tests: ## Run all tests
	pytest -v -n auto --dist loadscope --testmon tests/unit tests/integration tests/e2e

tests-basic: ## Run unit tests, integration tests and doctest
	pytest -v -n auto --dist loadscope --testmon tests/unit tests/integration

tests-e2e: ## Run unit tests, integration tests and doctest
	pytest -v -n auto --dist loadscope tests/e2e

cov: ## Check code coverage
	coverage run --source {{cookiecutter.package_name}} -m pytest tests/unit tests/integration --junit-xml=test_result.xml
	coverage report -m
	coverage html
	coverage xml

cov-basic: ## Check unit tests and integration tests code coverage
	coverage run --source {{cookiecutter.package_name}} -m pytest tests/unit tests/integration --junit-xml=test_result.xml
	coverage report -m
	coverage html
	coverage xml

docs: ## Generate Sphinx HTML documentation, including API docs
	rm -f docs/source/{{cookiecutter.package_name}}*.rst
	rm -f docs/source/modules.rst
	rm -rf docs/build
	rm -f docs/source/readme.md
	rm -f docs/source/release_notes.md
	sphinx-apidoc -o docs/source {{cookiecutter.package_name}}
	cp README.md docs/source/readme.md
	cp RELEASE_NOTES.md docs/source/release_notes.md
	sphinx-build -b html -c docs/source -W docs/source docs/build/html -D autodoc_member_order="bysource"

install: ## Install the package to the active Python's site-packages
	$(POETRY) install

jupyter: ## Launch Jupyter notebook
	export PYTHONPATH=$(shell pwd) && jupyter notebook

http: ## Launch HTTP server in localhost (in the first available port between 8000 and 8999)
	@$(PYTHON) -c "$$HTTP_SERVER_PYSCRIPT"

pre-commit: clean ## Run pre-commit without attempting a commit
	pre-commit run --all-files

format: ## Apply formatters
	black -l 100 .
	isort --profile black -l 100 .
	docformatter -r -i --wrap-summaries 100 --wrap-descriptions 90 .
