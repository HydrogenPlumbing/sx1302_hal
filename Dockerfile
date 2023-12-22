FROM arm64v8/alpine:3.19

RUN apk add --no-cache build-base git linux-rpi4 linux-headers

RUN mkdir hal
WORKDIR "/hal"
RUN git clone https://github.com/HydrogenPlumbing/sx1302_hal -b V2.1.0r7
WORKDIR "/hal/sx1302_hal"
RUN make clean all
WORKDIR "/hal/"
RUN tar -czf sx1302_hal.tar.gz sx1302_hal/
