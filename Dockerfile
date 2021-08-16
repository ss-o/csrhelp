FROM ubuntu:focal

RUN apt update && apt-get upgrade -y && apt-get install curl -y \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs git -y

WORKDIR /build

COPY . /build

RUN npm install -g npm serve && npm install

EXPOSE 5000
ENTRYPOINT ["serve", "app"]