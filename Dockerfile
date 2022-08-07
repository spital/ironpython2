
ARG BUILD_IMAGE_NAME

FROM debian:${BUILD_IMAGE_NAME}

RUN apt-get update && apt-get install -y build-essential cmake jq wget \
  pkg-config clang libclang-dev llvm-dev libudev-dev libfreetype6-dev \
  libexpat1-dev curl gcc make libssl-dev fonts-lato libc6-dev mono-complete \
  mc zstd sudo iputils-ping net-tools curl wget

WORKDIR /opt/tst

COPY . .

RUN dpkg -i ./ironpython_2.7.12.deb

RUN ipy -V

