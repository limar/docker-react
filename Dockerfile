FROM node:alpine AS build

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx AS run

COPY --from=build /app/build /usr/share/nginx/html