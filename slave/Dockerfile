FROM postgres:14.5

COPY ./setup-slave.sh /setup-slave.sh
RUN chmod +x /setup-slave.sh
ENTRYPOINT ["/setup-slave.sh"]