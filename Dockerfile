ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y libmemcached-dev \
                          build-essential \
                          sudo \
                          # GeoDjango requirements: \
                          libsqlite3-mod-spatialite binutils libproj-dev gdal-bin libgdal20 libgeoip1 \
                          # MySQL: \
                          mysql-client \
                          # Oracle: \
                          unzip libaio1 \
                          # Docs:
                          libenchant1c2a \
    && apt-get clean

RUN groupadd -r test && useradd --no-log-init -r -g test test
RUN echo "test ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test
RUN pip install --upgrade pip

COPY --chown=test:test tests/requirements/ /requirements/
RUN pip install -r /requirements/py3.txt
ARG EXTRA_REQUIREMENTS
RUN test -z ${EXTRA_REQUIREMENTS} || pip install -r /requirements/${EXTRA_REQUIREMENTS}

RUN mkdir /tests && chown -R test:test /tests
USER test:test
ENV PYTHONPATH "${PYTHONPATH}:/tests/django/"
VOLUME /tests/django
WORKDIR /tests/django
