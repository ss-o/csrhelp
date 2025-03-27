FROM alpine:3.16

RUn apk --no-cache update \
    && apk --no-cache upgrade \
    && apk add --no-cache curl nodejs npm git build-base ca-certificates \
    && apk add --no-cache --virtual .build-deps \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*


ENV USE

# Add a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Define environment variables
ENV NODE_ENV=production
ENV PORT=5000

WORKDIR /build
COPY . /build

RUN npm install -g npm \
    && npm install \
    && npm run postinstall

HEALTHCHECK --interval=15s --timeout=4s CMD curl -f http://localhost:$PORT/ || exit 1
EXPOSE $PORT
ENTRYPOINT ["npm", "start"]
