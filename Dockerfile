
ARG BUILD_IMAGE_NAME

FROM debian:stretch

RUN apt -y update && apt -y upgrade
