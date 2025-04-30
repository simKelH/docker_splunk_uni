FROM splunk/splunk:latest

ENV SPLUNK_START_ARGS=--accept-license
ENV SPLUNK_PASSWORD=password

ARG SPLUNKBASE_USERNAME
ENV SPLUNKBASE_USERNAME=$SPLUNKBASE_USERNAME
ARG SPLUNKBASE_PASSWORD
ENV SPLUNKBASE_PASSWORD=$SPLUNKBASE_PASSWORD

COPY inputs.conf /opt/splunk/etc/system/local/inputs.conf

EXPOSE 8000 8088 9997
CMD ["/opt/splunk/bin/splunk", "start", "--nodaemon"]
