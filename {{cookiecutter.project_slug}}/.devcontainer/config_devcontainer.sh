#!/bin/bash
git config --system --add safe.directory .
git config --system core.autocrlf false
git config --system pull.rebase false
git config --system core.ignoreCase false
git config --system http.sslVerify false
git config --system core.editor.nano

# Fetch to make sure that credentials are stored when installing dependencies
git config --system credential.helper store

git fetch

poetry config experimental.system-git-client true
poetry config virtualenvs.create false

poetry install --all-extras

mkdir ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry

echo "fpath+=~/.zfunc/_poetry" >> ~/.zshrc
echo "autoload -Uz compinit && compinit" >> ~/.zshrc

pre-commit install --hook-type pre-commit --hook-type pre-push --hook-type pre-merge-commit
