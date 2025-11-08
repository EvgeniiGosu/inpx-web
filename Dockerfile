FROM node:alpine

WORKDIR /srv/inpx-web

COPY . ./

RUN apk add zip && npm i && npm run build:client && node build/prepkg.js linux
RUN rm ./server/config/application_env; exit 0

EXPOSE 12380

CMD node server --inpx=$INPX --lib-dir=$LIBDIR --fb2c=$CONVERTER
