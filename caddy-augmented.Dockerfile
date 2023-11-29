ARG CADDY_VERSION=2.7.5
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/hslatman/caddy-crowdsec-bouncer/crowdsec

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
