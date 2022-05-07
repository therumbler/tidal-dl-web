FROM node:16.14.2-alpine AS base

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

RUN npm install -g npm@8.6.0

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
