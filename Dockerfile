FROM python:3.9.0-alpine

RUN apk add --no-cache curl python3 pkgconfig python3-dev openssl-dev libffi-dev musl-dev make gcc rust cargo

# RUN chown -R ci:ci /home/ci
# USER ci
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT [ "/bin/sh" ]
