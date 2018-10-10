# django-docker-box

[![Build Status](https://travis-ci.com/orf/django-docker-box.svg?branch=master)](https://travis-ci.com/orf/django-docker-box)

Run the django test suite across multiple databases.

Inspired by [django-box](https://github.com/django/django-box) this project contains 
some compose definitions to quickly run the Django test suite across multiple Python and
database versions, including Oracle.

## Quickstart

Clone this repository somewhere. Also make sure you have docker and docker-compose installed.

Ensure that the `DJANGO_PATH` variable is correct. You can either customize the variable:

`export DJANGO_PATH=~/projects/django/`
 
Or create a symbolic link to `django` inside this source:
 
`ln -s [path to django] [django docker box path]/django`

If you see an error like `ERROR: Named volume "django:/django:rw" is used in service "sqlite" but no declaration was found in the volumes section.` 
then your `DJANGO_PATH` is incorrect. Make sure it starts with a `./` or a `/`

Afterwards, simply run:

`docker-compose run --rm sqlite`

All arguments are passed to `runtests.py`. Before they are run all specific dependencies are 
installed (and cached across runs).


### Different databases

Simply substitute `sqlite` for any supported database:

`docker-compose run --rm postgres [args]`

`docker-compose run --rm mysql [args]`

`docker-compose run --rm mariadb [args]`

And if you're a madman you can run all the tests for all databases in parallel:

`docker-compose up`

#### Oracle

As usual Oracle is a bit more complex to set up. You need to download the latest `instantclient` **zip file**
[from this page](https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html) and place it inside the 
`./oracle` directory. Ensure only one `.zip` file is present.

The database image is quite large (several gigabytes) and takes a fairly long time to initialise (5-10 minutes). 
Once it has initialised subsequent starts should be very quick. To begin this process run:
 
 `docker-compose run oracle-db`

And wait for it to initialize. Once it has, use ctrl+c to terminate it and execute:

`docker-compose run --rm oracle`

To run the test suite against it. All other databases support different versions, however Oracle does not.

### Utilities

To run the docs spellchecker:

`docker-compose run --rm docs`

## Configuration

| Environment Variable | Default | Description |
| --- | --- | --- |
| `DJANGO_PATH` | `./django/` | The path to the Django codebase on your local machine |
| `PYTHON_VERSION` | `3.6` | The python version to run tests against |
| `POSTGRES_VERSION` | `9.6` | The version of Postgres to use |
| `MYSQL_VERSION` | `8` | The mysql version to use |
| `MARIADB_VERSION` | `10.3` | The mariadb version to use |


## Why?

I prefer using docker over Vagrant and virtualbox, which is what django-box uses. I think this 
approach is also simpler to quickly change the various database/python versions the test suite 
runs across. However both approaches work, so use whatever floats your boat.
