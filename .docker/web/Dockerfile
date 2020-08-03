FROM node:13-alpine as build-stage

# make the 'app' folder the current working directory
WORKDIR /app/talatuda/web
# copy both 'package.json' and 'package-lock.json' (if available)
COPY . .

# install project dependencies
RUN npm install

RUN npm run build

FROM nginx as production-stage
COPY --from=build-stage /app/talatuda/web/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]