ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y libenchant1c2a \
                          libmemcached-dev \
                          build-essential \
                          mysql-client \
                          unzip \
                          libaio1 \
                          sudo \
    && apt-get clean

RUN groupadd -r test && useradd --no-log-init -r -g test test
RUN echo "test ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test
RUN pip install --upgrade pip

RUN mkdir /django && chown -R test:test /django
COPY --chown=test:test entrypoint.sh /entrypoint.sh

USER test:test
ENV PYTHONPATH "${PYTHONPATH}:/django"
ENTRYPOINT /entrypoint.sh
CMD python tests/runtests.py
