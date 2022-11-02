FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y build-essential git make cmake clang libgflags-dev zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev python3-pip nodejs

WORKDIR /build

RUN git clone --depth=1 --branch OpenSSL_1_1_1j https://github.com/openssl/openssl.git
WORKDIR /build/openssl
RUN ./config && make -j4

WORKDIR /build

RUN git clone --depth=1 https://github.com/madler/zlib.git

RUN git clone https://github.com/emscripten-core/emsdk.git
WORKDIR /build/emsdk
RUN ./emsdk install 3.1.19 && ./emsdk activate 3.1.19

WORKDIR /build
COPY builder/em-zlib.sh .

WORKDIR /build/zlib
RUN /bin/bash ../em-zlib.sh

WORKDIR /build
COPY builder/em-openssl.sh .

WORKDIR /build/openssl
RUN /bin/bash ../em-openssl.sh

WORKDIR /build

RUN git clone --depth=1 --branch=vm-exec https://github.com/ton-community/ton-blockchain ton
WORKDIR /build/ton
RUN git submodule update --init --depth=1

WORKDIR /build

COPY builder/em-ton.sh .

WORKDIR /build/ton/build
RUN /bin/bash ../../em-ton.sh

COPY builder/cp-output.sh .

ENTRYPOINT [ "/bin/bash", "./cp-output.sh" ]