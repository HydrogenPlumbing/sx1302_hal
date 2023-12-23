FROM docker.io/arm64v8/alpine:3.18
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
RUN apk update && apk upgrade --no-cache


RUN mkdir hal
WORKDIR "/hal"
RUN git clone https://github.com/HydrogenPlumbing/sx1302_hal -b V2.1.0r7
WORKDIR "/hal/sx1302_hal"
RUN make clean all
WORKDIR "/hal/"
RUN tar -czf sx1302_hal.tar.gz sx1302_hal/
