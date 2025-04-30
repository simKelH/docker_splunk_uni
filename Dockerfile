FROM splunk/splunk:latest

ENV SPLUNK_START_ARGS=--accept-license
ENV SPLUNK_PASSWORD=password

ARG SPLUNKBASE_USERNAME
ENV SPLUNKBASE_USERNAME=$SPLUNKBASE_USERNAME
ARG SPLUNKBASE_PASSWORD
ENV SPLUNKBASE_PASSWORD=$SPLUNKBASE_PASSWORD

RUN /sbin/entrypoint.sh start && \
    /opt/splunk/bin/splunk enable listen 9997 -auth admin:changeme && \
    /opt/splunk/bin/splunk stop

RUN /opt/splunk/bin/splunk app install https://splunkbase.splunk.com/app/2846/release/1.6.9/download
RUN /opt/splunk/bin/splunk app install https://splunkbase.splunk.com/app/2800/release/1.6.4/download

EXPOSE 8000 8088 9997
CMD ["/opt/splunk/bin/splunk", "start", "--nodaemon"]
