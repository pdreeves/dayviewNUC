FROM amazonlinux

ARG splunkRPMURL
ARG splunkAdminPassword

LABEL maintainer="github.com/pdreeves"
LABEL version="8.2.2.1"
LABEL description="Stand-alone container for Splunk"

# Install EPEL
RUN amazon-linux-extras install epel -y

# Update, install applications, and clean updates
RUN yum update -y && \
  yum install python3 screen zsh ansible wget procps -y && \
  yum clean all && \
  rm -rf /var/cache/yum

# Install Splunk
RUN wget -q -O /opt/splunk.rpm "$splunkRPMURL" && \
	rpm -i /opt/splunk.rpm && \
	rm /opt/splunk.rpm && \
	chown -R splunk:splunk /opt/splunk
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY user-seed.conf /opt/splunk/etc/system/local/user-seed.conf
COPY splunk.License /opt/splunk/etc/system/local/splunk.License
USER splunk
RUN echo "OPTIMISTIC_ABOUT_FILE_LOCKING = 1" > /opt/splunk//etc/splunk-launch.conf && \
	/opt/splunk/bin/splunk start --accept-license && \
	/opt/splunk/bin/splunk add licenses /opt/splunk/etc/system/local/splunk.License -auth admin:$splunkAdminPassword && \
	/opt/splunk/bin/splunk stop && \
	mkdir /opt/splunk/etc/apps/greentangent-container/ && \
	mkdir /opt/splunk/etc/apps/greentangent-workspace/

EXPOSE 8000

VOLUME /opt/splunk/etc/apps/greentangent-container/
VOLUME /opt/splunk/etc/apps/greentangent-workspace/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["splunk"]