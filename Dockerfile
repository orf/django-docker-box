ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y libenchant1c2a \
                          libmemcached-dev \
                          build-essential \
                          mysql-client \
                          unzip \
                          libaio1 \
    && apt-get clean
RUN pip install --upgrade pip

COPY entrypoint.sh /entrypoint.sh

WORKDIR /django
ENV PYTHONPATH "${PYTHONPATH}:/django"

ENTRYPOINT /entrypoint.sh
CMD python tests/runtests.py
