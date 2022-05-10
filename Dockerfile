FROM alpine

ENV USER "puppeteer"
ENV TESTDIR /tests

# install packages
RUN apk add nodejs yarn chromium bash curl

# install puppeteer
RUN yarn add puppeteer

# set user
RUN adduser -s /bin/bash -g users --disabled-password $USER

WORKDIR /usr/src/app

COPY package.json yarn.lock index.js ./

RUN mkdir /export

RUN yarn install

COPY index.js ./

CMD [ "node", "index.js" ]
