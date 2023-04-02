############################################################
# Build Dependencies
############################################################

FROM node:16-alpine3.13@sha256:c7f8af31c7c4bb2221da18b67ccbe6d0632dab86d015573857b5a91afbedcf8c AS builder

COPY package.json ./

RUN yarn install

############################################################
# Build Application
############################################################

FROM node:16-alpine3.13@sha256:c7f8af31c7c4bb2221da18b67ccbe6d0632dab86d015573857b5a91afbedcf8c

MAINTAINER Sarthak Gupta <sarthakguptasg001@gmail.com>

WORKDIR /app

RUN apk --no-cache add dumb-init

# Remove package manager
RUN rm -rf /sbin/apk /etc/apk /lib/apk /usr/share/apk /var/lib/apk

COPY --from=builder node_modules ./node_modules

COPY --chown=node:node server.js controller.js routes.js package.json package-lock.json /app/

USER node

EXPOSE 3000

# Healthcheck at every 5 minutes
HEALTHCHECK --interval=5m --timeout=3s \
 CMD curl https://localhost:3000/ -k || exit 1

CMD [ "dumb-init", "yarn", "start" ]
