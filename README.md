# django-docker-box

Run the django test suite across multiple databases.

Inspired by [django-box](https://github.com/django/django-box) this project contains 
some compose definitions to quickly run the Django test suite across multiple Python and
database versions.

## Quickstart

Clone this repository somewhere. Also make sure you have docker and docker-compose installed.

Ensure that the `DJANGO_PATH` variable is correct. You can either customize the variable:

`export DJANGO_PATH=~/projects/django/`
 
Or create a symbolic link to `django-src` inside this source:
 
`ln -s [path to django] [django docker box path]/django-src`

If you see an error like `ERROR: Named volume "django:/django:rw" is used in service "sqlite" but no declaration was found in the volumes section.` 
then your `DJANGO_PATH` is incorrect.

Afterwards, simply run:

`docker-compose run sqlite`

All arguments are passed to `runtests.py`. Before they are run all specific dependencies are 
installed (and cached across runs).


### Different databases

Simply substitute `sqlite` for any supported database:

`docker-compose run postgres [args]`

`docker-compose run mysql [args]`

`docker-compose run mariadb [args]`

Note: The oracle image requires authentication and is rather large. 
[See here on how to authenticate](https://docs.oracle.com/cd/E37670_01/E75728/html/oracle-registry-server.html)

`docker-compose run oracle`

If you're a madman you can run all the tests for all databases in parallel:

`docker-compose up`

### Utilities

To run the docs spellchecker:

`docker-compose run docs`

## Configuration

| Environment Variable | Default | Description |
| --- | --- | --- |
| `DJANGO_PATH` | `django/` | The path to the Django codebase on your local machine |
| `PYTHON_VERSION` | `3.6` | The python version to run tests against |
| `POSTGRES_VERSION` | `9.6` | The version of Postgres to use |
| `MYSQL_VERSION` | `8` | The mysql version to use |
| `MARIADB_VERSION` | `10.3` | The mariadb version to use |
| `ORACLE_VERSION` | `12.1.0.2` | The oracle version to use |


## Why?

I prefer using docker over Vagrant and virtualbox, which is what django-box uses. I think this 
approach is also simpler to quickly change the various database/python versions the test suite 
runs across. However both approaches work, so use whatever floats your boat.