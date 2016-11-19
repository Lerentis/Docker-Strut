FROM node:7-alpine

RUN apk add -U libpng-dev libpng zlib zlib-dev build-base file nasm autoconf libjpeg-turbo-utils gcc make git; npm install -g grunt-cli; git clone git://github.com/tantaman/Strut.git
WORKDIR ./Strut
RUN sed -i.bak 's/"grunt-mocha": "~0.2.2",/"grunt-mocha": "~0.3",/' /Strut/package.json; npm install;apk del build-base file nasm autoconf gcc make git && rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["grunt", "server"]	