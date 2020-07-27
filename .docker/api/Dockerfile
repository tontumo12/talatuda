FROM node:boron
RUN mkdir -p /app/talatuda/api
# Create app directory
WORKDIR /app/talatuda/api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./app/talatuda/api/

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . ./app/talatuda/api

EXPOSE 3000

CMD [ "npm", "start" ]