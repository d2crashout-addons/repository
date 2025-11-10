ARG BUILD_FROM
FROM $BUILD_FROM

# Install ntfy
RUN apk add --no-cache ntfy

# Copy addon files
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
