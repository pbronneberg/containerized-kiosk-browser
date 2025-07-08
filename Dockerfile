FROM ubuntu:24.04 AS downloader
WORKDIR /opt/download
RUN apt update && apt install -y curl unzip bzip2

RUN curl -o cefsample.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_136.1.6%2Bg1ac1b14%2Bchromium-136.0.7103.114_linux64_client.tar.bz2
RUN tar -xvjf cefsample.tar.bz2 --strip-components=1

FROM ubuntu:24.04 AS runtime

ARG DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility

RUN apt update && apt install -y --no-install-recommends xorg xinit i3 libnss3 \
    libasound2t64 libdbus-1-3 libatk1.0-0t64 libatk-bridge2.0-0t64 libcups2t64 \
    libxcomposite1 libxdamage1 libxrandr2 libpango-1.0-0 libcairo2\
    vulkan-tools pciutils mesa-utils\
    && rm -rf /var/lib/apt/lists/*

COPY .xinitrc /root

USER ubuntu
COPY .xinitrc /home/ubuntu

WORKDIR /opt/app
COPY --from=downloader /opt/download/Release .

RUN mkdir /opt/app/config
COPY i3.config /opt/app/config

CMD ["startx"]
