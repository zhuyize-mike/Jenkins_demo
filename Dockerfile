#multi-stage build 
# https://stackoverflow.com/questions/66353510/what-is-from-used-in-copy-command-in-dockerfile

FROM node:16.14.2 as build
WORKDIR /code
COPY . .
RUN npm ci 
RUN npm run build

FROM nginx:1.21.6-alpine
COPY --from=build /code/build /usr/share/nginx/html
EXPOSE 80

CMD ["nginx","-g","daemon off;"]
# meaning of daemon of
# directive tells Nginx to stay in the foreground.
# For containers this is useful as best practice is for one container = one process. 
# One server (container) has only one service.