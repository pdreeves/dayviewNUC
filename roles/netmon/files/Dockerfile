FROM centos:centos7

LABEL maintainer="github.com/pdreeves"
LABEL version="1.0.0"
LABEL description="Stand-alone container for network monitoring"

# Update, install applications, and clean updates
RUN yum install mtr jq iputils wget -y && \
  yum clean all && \
  rm -rf /var/cache/yum

# Install speedtest
RUN curl -s https://install.speedtest.net/app/cli/install.rpm.sh | bash && \
	yum install speedtest -y && \
	/bin/speedtest --accept-license

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["netmon"]