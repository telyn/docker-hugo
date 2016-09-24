FROM alpine:3.4
MAINTAINER Telyn Z. <telyn@aetheria.co.uk>

ENV HUGO_VERSION 0.16
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

# Install pygments (for syntax highlighting)
RUN apk update && apk add py-pygments git openssh rsync && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tgz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tgz -C /usr/local/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tgz

EXPOSE 1313
CMD hugo version
