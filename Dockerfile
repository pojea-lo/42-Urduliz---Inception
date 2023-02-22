FROM alpine:3.14

COPY start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]
