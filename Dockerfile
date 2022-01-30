FROM alpine:3.6
MAINTAINER Jonathan Baldie "jon@jonbaldie.com"

EXPOSE 8000

RUN apk add --no-cache build-base curl git

ARG JANET=1.20.0

# Move to tmp and install janet
RUN git clone --depth 1 --branch v$JANET https://github.com/janet-lang/janet.git /tmp/janet && \
    cd /tmp/janet && \
    make all test install

RUN git clone --depth=1 https://github.com/janet-lang/jpm.git && \
    cd jpm && \
    janet bootstrap.janet && \
    jpm install jpm

RUN chmod 777 /usr/local/lib/janet
RUN jpm install joy

# Intention is to mount your code to /usr/src/app
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
