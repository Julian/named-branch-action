FROM alpine:3.10
COPY LICENSE README.rst /
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
