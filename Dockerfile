FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

RUN apk --no-cache update \
    && apk --no-cache upgrade \
    && apk add --no-cache curl nodejs npm git build-base ca-certificates \
    && npm install -g pnpm \
    && apk del build-base \
    && rm -rf /var/cache/apk/*

# Define environment variables
ENV NODE_ENV=production
ENV USER=appuser
ENV GROUP=appgroup

# Add a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /build
COPY . /build

RUN pnpm install

HEALTHCHECK --interval=15s --timeout=4s CMD curl -f http://localhost:5000/ || exit 1
EXPOSE 5000
ENTRYPOINT ["pnpm", "start"]
