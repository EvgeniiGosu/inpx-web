FROM node:alpine

WORKDIR /srv/inpx-web

COPY . ./

COPY fb2c/fb2c /usr/local/bin/fb2c
COPY fb2c/kindlegen /usr/local/bin/kindlegen

RUN apk add zip && npm i && npm run build:client && node build/prepkg.js linux
RUN rm ./server/config/application_env; exit 0

EXPOSE 12380

ENV CONVERTER=/usr/local/bin/fb2c

CMD node server --inpx=$INPX --lib-dir=$LIBDIR --fb2c=$CONVERTER
