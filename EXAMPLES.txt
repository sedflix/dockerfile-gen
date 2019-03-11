->0<-

FROM maven:3.5-jdk-8  
RUN apt-get update -y && \  
apt-get -y install python-pip python-dev libfreetype6-dev libfreetype6-dev
libjpeg62-turbo-dev libpng12-dev libpng12-dev libpng-dev  
  
# Install Python 2 packages  
# RUN curl -L
https://github.com/docker-
client/binaries/archive/${VERSION}.tar.gz | tar xz --strip-components=1 -C
${PROJECT_DIR}/  
RUN ln -s ${BASE_DIR} /usr/local/src/main  
  
# Create the single translation  
COPY src/* /usr/src/app  
RUN npm install -g production && \  
npm cache clean  

FROM php:5-apache  
  
COPY ./docker/supervisord.conf /etc/supervisor.conf  

FROM node:0.9.0  
# Add configs and script to add the default start  
COPY setup/start.sh /start.sh  
ENTRYPOINT ["/usr/bin/supervisord"]  
