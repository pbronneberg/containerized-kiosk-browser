FROM ubuntu:24.04 AS downloader
WORKDIR /opt/download
RUN apt update && apt install -y curl unzip bzip2

RUN curl -o cefsample.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_136.1.6%2Bg1ac1b14%2Bchromium-136.0.7103.114_linux64_client.tar.bz2
RUN tar -xvjf cefsample.tar.bz2 --strip-components=1

FROM ubuntu:24.04 AS runtime
WORKDIR /opt/app
RUN apt update && apt install -y --no-install-recommends cage libnss3 \
    libasound2t64 libdbus-1-3 libatk1.0-0t64 libatk-bridge2.0-0t64 libcups2t64 \
    libxcomposite1 libxdamage1 libpango-1.0-0 libcairo2\
    && rm -rf /var/lib/apt/lists/*

COPY --from=downloader /opt/download/Release .
CMD ["cage", "/opt/app/cefsimple", "--", "--no-sandbox"]
