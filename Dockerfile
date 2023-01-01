FROM node:16-alpine as builder

WORKDIR "/app"
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder ./build /usr/share/nginx/html
