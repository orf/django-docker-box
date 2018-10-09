ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y libmemcached-dev \
                          build-essential \
                          sudo

RUN groupadd -r test && useradd --no-log-init -r -g test test
RUN echo "test ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test
RUN pip install --upgrade pip

RUN mkdir /tests && chown -R test:test /tests
COPY --chown=test:test entrypoint.sh /entrypoint.sh

USER test:test
ENV PYTHONPATH "${PYTHONPATH}:/tests/django"
ENTRYPOINT /entrypoint.sh
WORKDIR /tests
