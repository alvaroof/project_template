# Cookiecutter PyPackage

This is a [Cookiecutter](https://github.com/cookiecutter/cookiecutter)

The template was created taking as a reference:

* GitHub repo: https://github.com/audreyfeldroy/cookiecutter-pypackage/

## Features

Repositories created from this template include

* Proper repository structure with pre-defined folders.
* Code documentation with `Sphinx`.
* Testing setup and code coverage with `pytest`and `pytest-cov`.
* Code examples within code documentation is tested with `doctest`.
* Code linting with `pytlint` and `flake8`.
* Documentation linting with `darglint`.
* Complexity measurement with `radon`.
* Code formatting with `black`.
* Git hooks with `pre-commit`.
* Command line interface using `Click`.
* `Makefile` with pre-defined targets to automate tasks.

## Cloning

Clone the repository with:

```shell
git clone https://github.com/alvaroof/project_template
```

## How to use - Docker container and VSCode

Open VSCode then open `cookicutter.code-workspace` file. VSCode will automatically open the project within a Docker container.

Open VSCode terminal and type `make`. This will create just the project scaffold within the `out` directory.

During the process you will be asked:

* `project_name` - Project name (see "Naming conventions" section)
* `project_slug` - Name of the main root directory (see "Naming conventions" section)
* `package_name` - Package name (see "Naming conventions" section)
* `version` - Initial version; we recommend using the default value

## How to use - No Docker container

Install the latest Cookiecutter (it is highly recommended to do it within a virtual environment):

```shell
pip install -U cookiecutter
```

Create Python package project from the template:

```shell
cookiecutter cookiecutter_pypackage
```

 This will create just the project scaffold. During the process you will be asked about: `project_name`, `project_slug`, `package_name` and `version` (see previous section).

## Naming conventions

### Project name

The name of the project shall be short and descriptive enough

### Project slug

It shall be like `project_name` (in [snake case](https://en.wikipedia.org/wiki/Snake_case) format).

### Package name

The acronym should be generated from the project root directory.

### Example

|    Field                  |          Example                                                                               |
| :------------------------ | :--------------------------------------------------------------------------------------------- |
| Project name              | Project Name                                                                |
| Project slug              | py_doing_something                                                                         |
| Package name              | pysomething                                                                                        |
| Repository url (optional) | https://github.com/alvaroof/project_template.git |
| Description (optional)    | This project aims to do something                                 |

## Push the scaffold to an existing repository

Create a new Git project in Gitlab. Then we will push the new project scaffold with:

```shell
cd your_new_project_scaffold
git init
git remote add origin <url>
git add .
git commit -m "Initial commit"
git push -u origin master
```
