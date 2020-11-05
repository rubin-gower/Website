FROM node:12.18.2 as build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN ["npm", "run", "start"]
 
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html