# Dockerfile Generator 
Generates random Dockerfile using char-rnn

## Usage

### Pre-reqs

Dependencies:
- pytorch
- numpy
- jupyter
- docker/nvidia-docker(optional)

You are requied to clone this repo and download data(if you want to train) or weights(if you just want to checkout).
```
git clone https://github.com/sedflix/dockerfile-gen.git
cd dockerfile-gen
chmod +x ./get_data.sh
chmod +x ./get_weights.sh
./get_data.sh
```

### Using Docker

Build the image using:
```
nvidia-docker build -t dockerfile-gen .
```

Run the notebook using:

```
nvidia-docker run -it --ipc=host -v $PWD:/app -p 8989:8989 dockerfile-gen
```

### Without Docker

- install pytorch using https://pytorch.org/
- install jupyter using your preferred method
- start notebook using your preferred method

## Examples

You can find more example in [EXAMPLES.txt](https://github.com/sedflix/dockerfile-gen/blob/master/EXAMPLES.txt). Or you can try it on your own using `rnn_best.net` provided in the repo. A few selected samples are given below:

**Note**: These are examples are from the end of 1st epoch. So they are pretty shit.

#### 1
```
FROM ubuntu:14.04  
MAINTAINER Daniel Pontang <mritden@ansible.com>  
  
RUN apt-get update && apt-get install -y python-pip \  
&& curl -fSL "https://github.com/docker/bin/linux/amd64/elasticsearch-$SPARK_VERSION.tar.gz" | tar -xz \  
&& cd /tmp/gradle-latest.zip  
  
RUN apt-get install -qqy \--no-install-recommends \  
binare \  
git \  
curl  
  
WORKDIR /opt  
CMD [ "/opt/steamcmd/spark-command.sh"]  
```

#### 2
```
FROM debian:jessie-slim  
  
RUN apt -y update
&& apt upgrade -y  
  
RUN apt clean  
  
RUN cd /tmp && \  
apt-get install --force-yes python-pip && \  
apt-get install -y \  
libssl-dev \  
libssl-dev \  
postgresql-client \  
python-dev \  
cpp \  
python-dev \  
&& python3 -m usermod -g 1000 nginx \  
&& mkdir -p .bootstrap \  
&& rm /etc/nginx/modules \  
&& sed -i "s/^;date.timezone =\/set docker -e "debconf-
setess
/usr/sbin/apt-apt-server/remote.py \  
&& sed -i 's/;cat \/usr\/local/g' /etc/php.sock; \  
echo "package info store android apt-get --allow-unauthenticated compatible-daemonize.so\n" >>
/var/log/nginx/access.log \  
&& echo "php-fpm catalogued-plugin:/static/debconf  
```

#### 3
```
FROM ubuntu  
# Create directories  
RUN chown -R www-data:www-data /var/log/package  
RUN mkdir -p /etc/systemd/system/sockets  
RUN mkdir /var/www/app  
  
ENV PATH "$PATH:/home/start/plugins/container-schemascraft-docker.sh  
  
ADD conf /usr/src/app/  
  
# Install the code  
RUN mkdir -p /var/lib/mysql /var/log/nginx  
COPY package.json ./  
COPY . /root/  
CMD ["bash", "broker.sh"]  
```
