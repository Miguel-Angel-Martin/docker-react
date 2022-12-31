#this file is for production.
FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# FROM node:18-alpine3.16 as builder
# USER node
# RUN mkdir -p /home/node/app
# WORKDIR /home/node/app
# COPY --chown=node:node ./package.json ./
# RUN npm install
# COPY --chown=node:node ./ ./
# RUN npm run build
# #CMD ["npm", "run", "build"]

# # the route for the build is /home/node/app/build

# FROM nginx
# #Expose the port.
# EXPOSE 80 
# COPY --from=builder /home/node/app/build /usr/share/nginx/html


