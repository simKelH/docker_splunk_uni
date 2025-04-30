FROM splunk/splunk:latest

ENV SPLUNK_START_ARGS=--accept-license
ENV SPLUNK_PASSWORD=password
ENV SPLUNK_APPS_URL=https://splunkbase.splunk.com/app/2846/release/1.6.9/download, https://splunkbase.splunk.com/app/2800/release/1.6.4/download

RUN /sbin/entrypoint.sh start && \
    /opt/splunk/bin/splunk enable listen 9997 -auth admin:changeme && \
    /opt/splunk/bin/splunk stop
