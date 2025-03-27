FROM alpine:latest

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

RUN pnpm install \
    && pnpm run postinstall

HEALTHCHECK --interval=15s --timeout=4s CMD curl -f http://localhost:5000/ || exit 1
EXPOSE 5000
ENTRYPOINT ["pnpm", "start"]
