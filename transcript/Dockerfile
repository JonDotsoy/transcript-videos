FROM python:3.13.2 AS base
WORKDIR /usr/share/app

FROM base as builder
COPY . .
RUN make install
