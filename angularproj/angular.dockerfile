FROM node:16 as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY src /app
RUN npm run build --prod
FROM nginx:stable-alpine
COPY --from=build-step /app/dist/* /usr/share/nginx/html
EXPOSE 4200:80
