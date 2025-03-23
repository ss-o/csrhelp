FROM ubuntu:kinetic-20230624@sha256:e322f4808315c387868a9135beeb11435b5b83130a8599fd7d0014452c34f489

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt-get upgrade -y && apt-get install curl -y \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs git build-essential ca-certificates -y \
    && apt autoremove -y && apt clean

WORKDIR /build
COPY . /build

RUN npm install -g npm \
    && npm install \
    && npm run postinstall

HEALTHCHECK --interval=15s --timeout=4s CMD curl -f http://localhost:5000/ || exit 1
EXPOSE 5000
ENTRYPOINT ["npm", "start"]
