FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app/talatuda/web
# copy both 'package.json' and 'package-lock.json' (if available)
COPY package.json /app/talatuda/web

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . /app/talatuda/web

# build app for production with minification
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app/talatuda/web
COPY --from=build-stage /web/dist /app/talatuda/web
COPY .docker/config/nginx.conf /etc/nginx/nginx.conf