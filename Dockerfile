
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

RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y dotnet-sdk-6.0

RUN dotnet --list-sdks && dotnet --list-runtimes

