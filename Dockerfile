# We base our image on the one called "node" which exists on the Docker Hub
# The base image is not needed to be downloaded localy.
FROM node

WORKDIR /app

COPY package.json /app

# install dependencies
# inside the image
RUN npm install

# Copy all files and dirs from the path, where the Dockerfile is to
# Folder /app inside the image.
# In this case it is also .idea folder and *.iml file, so THIS IS WRONG.
# since we set the WORKDIR, we don't need specify the path "/app" in here, but it is better for readability
COPY . /app

EXPOSE 80

# Start node server.
# We do not start the server inside the image when the image is created
# We nneed to start the server when the container is started and that's why we use CMD instruction
CMD ["node", "server.js"]