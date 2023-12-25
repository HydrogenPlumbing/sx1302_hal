FROM docker.io/arm32v7/alpine:3.18
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache build-base git linux-rpi4 linux-headers
RUN mkdir /hal
WORKDIR /hal
COPY . .
RUN ls -lh
RUN make clean all
