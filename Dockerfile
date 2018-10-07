ARG PYTHON_VERSION=3.6
FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y libmemcached-dev build-essential \
    && apt-get clean

COPY entrypoint.sh /entrypoint.sh

WORKDIR /django
ENV PYTHONPATH "${PYTHONPATH}:/django"

ENTRYPOINT /entrypoint.sh
CMD python tests/runtests.py
