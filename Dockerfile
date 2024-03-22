
FROM node as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
