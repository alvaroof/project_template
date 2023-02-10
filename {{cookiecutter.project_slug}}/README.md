# {{ cookiecutter.project_name }}

{{ cookiecutter.project_description }}

## Dependencies

Lorem ipsum...

## Cloning and first steps

```shell
git clone <repo_url>
```

After having cloned the repo, create a virtual environment and install Python packages:

```shell

# Install packages
Run `make venv` to install all the dependencies and setup pre-commit hooks.

## Installation

Install package via pip using:

```shell
pip install .
```

## Passwords

Some applications connect to any third-party service (for example a SQL server) requiring
a user name and a password.

This kind of information shall be never be hardcoded in the code or saved in any configuration
file that may be uploaded to the repository.

A simple way to handle critical data is saving them as environment variables.

Simply create a `.env` file at the root of the repository. Then and save user names and passwords
like:

```
YOUR_USERNAME=your_username
YOUR_PASSWORD=your_password
```

You can then read `.env` files for Python code with the `dotenv` package.

`.env` files are excluded from the Git repository in the `.gitignore` file.

## Poetry

To include a new package to the project it has to be added into the pyproject.toml
under the correct group. Application packages have to be included inside `tool.poetry.dependencies`.
Other packages have to be included in their respective groups like dev, docs or custom groups.

To add a package run `poetry add [options] [--] <name>`. You can indicate the group to
add the dependency to with the option `--group=GROUP`.

To remove a package run `poetry remove [options] [--] <packages>`. You can indicate the group to
remove the dependency from with the option `--group=GROUP`.

To update the `poetry.lock` file, run `poetry lock --no-update`.

Run `poetry list` to get more information about all the commands that poetry can run.

## Testing

To verify correct installation, execute the {{ cookiecutter.project_name }} tests by running
the following command in your Python environment:

```shell
make tests-basic
```

## Generate documentation

Run the following command to generate project documentation:

```shell
make docs
```

## Contributors

- Contributor name ([contributor email](mailto:contributor email))
