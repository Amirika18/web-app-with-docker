FROM node:lts-alpine as build-app
WORKDIR /vue

RUN apk update && apk add git
ADD https://api.github.com/repos/Amirika18/rest_application/git/refs/heads/enaumova enaumova.json
RUN git clone -b enaumova https://github.com/Amirika18/rest_application.git
RUN mv -v ./rest_application/* ./
RUN rm -r rest_application

RUN npm install
EXPOSE 5173
CMD ["npm", "run", "dev"]

