FROM node:13-alpine as build-stage

# make the 'app' folder the current working directory
WORKDIR /app/talatuda/web
# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

COPY . .

RUN npm run build

FROM nginx:stable-alpine as production-stage

RUN mkdir /app/talatuda/web

COPY --from=build-stage /app/talatuda/web/dist /app/talatuda/web

CMD ["nginx", "-g", "daemon off;"]