FROM node:latest as node
RUN mkdir -p app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/my-app /usr/share/nginx/html
