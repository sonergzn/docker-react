FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN ["npm", "run", "build"] 



FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html
#COPY from the builder phase, /app/build folder TO the container under /usr/share/nginx/html folder.
## We saying '/app/build' because the folder 'build' will be made by builder phase itself.

EXPOSE 8080