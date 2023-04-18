FROM node as build

# Specify the directory inside the image in which all commands will run
WORKDIR /usr/src/app

# copy app.js into container
COPY ./app.js .

# Copy all of the app files into the image
COPY . .

FROM node:8-alpine

COPY --from=build /usr/src/app /
EXPOSE 3000
# On a container startup run the application
CMD node app.js
