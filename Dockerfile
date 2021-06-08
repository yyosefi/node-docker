FROM node:12.18.1
ENV NODE_ENV=production
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]



# syntax=docker/dockerfile:1
#FROM node:14.15.4 as base

#WORKDIR /code

#COPY package.json package.json
#COPY package-lock.json package-lock.json

#FROM base as test
#RUN npm ci
#COPY . .
#The CMD statement is not executed during the building of the image but is executed when you run the image in a container
#CMD [ "npm", "run", "test" ]

#FROM base as prod
#RUN npm ci --production
#COPY . .
#CMD [ "node", "server.js" ]


# syntax=docker/dockerfile:1
#FROM node:14.15.4 as base

#WORKDIR /code

#COPY package.json package.json
#COPY package-lock.json package-lock.json

#FROM base as test
#RUN npm ci
#COPY . .
#tests will be run during the building of the image and stop the build when they fail.
#RUN npm run test

#FROM base as prod
#RUN npm ci --production
#COPY . .
#CMD [ "node", "server.js" ]
