FROM pandoc/latex:2.11.4

RUN apk --no-cache add \
        curl \
        py3-pip \
        python3 \
        pkgconfig \
        python3-dev \
        openssl-dev \
        libffi-dev \
        musl-dev \
        make \
        gcc \
        rust \
        cargo

# as this can take a while, we put it in the build stage
RUN pip3 install cryptography

# RUN chown -R ci:ci /home/ci
# USER ci
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT [ "/bin/sh" ]
