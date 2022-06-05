FROM alpine

LABEL maintainer="github.com/pdreeves"
LABEL version="1.0.0"
LABEL description="Stand-alone container for network monitoring"

# Install applications
RUN apk add mtr jq iputils wget speedtest-cli

# Accept speedtest license
RUN /usr/bin/speedtest --accept-license

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["netmon"]