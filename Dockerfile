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
        cargo \
        openssh-client \
        git

# as this can take a while, we put it in the build stage
RUN pip3 install cryptography

# as this image will be used for unittest we add some requirements
RUN tlmgr update --self && \
    tlmgr install sectsty \
        fvextra \
        wrapfig \
        titling \
        everypage \
        background \
        framed

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV PATH="/root/.local/bin:${PATH}"

# wkhtmltopdf require patched qt to allow extra feature
# building a local copy could take hours to complete
# thus we are using already existing binary
COPY --from=madnight/alpine-wkhtmltopdf-builder:0.12.5-alpine3.10 \
    /bin/wkhtmltopdf /bin/wkhtmltopdf

ENTRYPOINT [ "/bin/sh" ]
