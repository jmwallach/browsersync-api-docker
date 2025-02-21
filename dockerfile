FROM node:18.20.7-alpine
# Set environment variables
ENV XBROWSERSYNC_API_VERSION 1.1.13

WORKDIR /usr/src/api

# Download release and unpack




RUN wget -q -O release.tar.gz https://github.com/jmwallach/browsersync-api-docker/archive/refs/tags/$XBROWSERSYNC_API_VERSION.tar.gz \
	&& tar -C . -xzf release.tar.gz \
	&& rm release.tar.gz \
	&& mv api-$XBROWSERSYNC_API_VERSION/* . \
	&& rm -rf api-$XBROWSERSYNC_API_VERSION/

# Install dependencies
RUN npm install --only=production

# Expose port and start api
EXPOSE 8080
CMD [ "node", "dist/api.js"]
