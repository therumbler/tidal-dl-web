FROM node:16.14.2-alpine AS base

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade

RUN apk add git
RUN npm install -g npm@8.6.0
RUN apk add build-base

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip && ln -sf python3 /usr/bin/python
RUN python3 -m pip install --no-cache --upgrade pip setuptools
RUN python3 -m pip install --no-cache --upgrade tidal-dl



# copy the app, note .dockerignore 
COPY package*.json /usr/src/nuxt-app/
RUN npm install
COPY . /usr/src/nuxt-app/
RUN npm run build


FROM base AS release
RUN mkdir -p /usr/nuxt-app/.output
WORKDIR /usr/nuxt-app
COPY --from=base /usr/src/nuxt-app/package.json /usr/nuxt-app/
COPY --from=base /usr/src/nuxt-app/.output/ /usr/nuxt-app/.output/

EXPOSE 3000

ENV HOST=0.0.0.0
ENV PORT=3000

CMD [ "npm", "start"]
