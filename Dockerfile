FROM ubuntu:24.04 AS chrome-downloader

RUN apt update && apt install -y curl unzip bzip2

RUN curl -O https://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/252451/chrome-linux.zip
RUN unzip chrome-linux.zip

FROM ubuntu:24.04 AS runtime
WORKDIR /opt/app
RUN apt update && apt install -y --no-install-recommends cage libnss3 libasound2t64 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=chrome-downloader /chrome-linux .
ENTRYPOINT ["cage", "chrome", "--", "--no-sandbox"]
