.PHONY: all
.DEFAULT_GOAL := all

POETRY=poetry

all:
	@echo "\nWelcome to the cookiecutter for Python packages\n"
	@cookiecutter . -o out

venv: ##Make Python virtual environment
	$(PIP) install --no-cache-dir wheel poetry
	$(POETRY) config virtualenvs.create false
	$(POETRY) install --all-extras

clean:
	@find out -type d \( ! -name "out" \) -exec rm -rf {} +
	@find out -type f \( ! -name ".gitkeep" \) -exec rm -rf {} +

install: ## Install the package to the active Python's site-packages
	$(POETRY) install

pre-commit: ## Run pre-commit without attempting a commit
	pre-commit run --all-files
