# Dockerfile Generator 
Generates random Dockerfile using char-rnn.  
(Yeah, it's useless. Like anyother thing done while procrastinating. All shitty things done in this repo are justified as it saved my time allowing me to actually work) 

## Usage

### Pre-reqs

Dependencies:
- pytorch
- numpy
- jupyter
- docker/nvidia-docker(optional)

You are requied to clone this repo and download the data(if you want to train). Cloning this repo gonna be slow as it has a ~90MB file storing the model's weights.

```
git clone https://github.com/sedflix/dockerfile-gen.git
cd dockerfile-gen
chmod +x ./get_data.sh
./get_data.sh
```

### Using Docker

Build the image using(this is going to be even slower as the base image is not optimisied at all):
```
nvidia-docker build -t dockerfile-gen .
```

Run the notebook on port 8989 using:

```
nvidia-docker run -it --ipc=host -v $PWD:/app -p 8989:8989 dockerfile-gen
```

### Without Docker

- install pytorch using https://pytorch.org/
- install jupyter using your preferred method
- start jupyter and open `dockerfile-generator.ipynb` using your preferred method

 ## Examples

You can find more example in [EXAMPLES_E5.txt](https://github.com/sedflix/dockerfile-gen/blob/master/EXAMPLES_E5.txt). Or you can try it on your own using `rnn_best.net` provided in the repo. A few selected samples are given below:

**Note**: These are examples are from the end of 5th epoch. So they are not as great at all.

#### Sample 1
```
FROM dockerfile/nodejs  
  
MAINTAINER Matthew Bullstanger <matt.moner@gmail.com>  
  
# Install python 3  
RUN apt-get update \  
&& apt-get install -y \  
graphviz \  
libssl-dev \  
libssl-dev \  
libxml2-dev \  
libxslt-dev \  
libffi-dev \  
libssl-dev \  
libcurl4-openssl-dev \  
libpq-dev \  
libxml2-dev \  
libxslt1-dev \  
python-pip \  
python-dev \  
python-numpy \  
python-pip  
  
# Install python packages  
RUN apt-get update && apt-get install -y --no-install-recommends \  
ca-certificates \  
curl \  
&& apt-get clean  
  
RUN git clone \--depth 1 https://github.com/creationix/nvm.git
/usr/local/nvm \  
&& cd /usr/local/nvm \  
&& git checkout $VERSION \  
&& ./configure && make install \  
&& cd .. && rm -fr video_$VERSION_VERSION \  
&& ln -s ../../varnish-$VERSION varnish && ln -s varnish-$VERSION /var/log  
# Add and install php  
# RUN curl -sS https://getcomposer.org/installer | php -- --install-
dir=/usr/local/bin --filename=composer  
# RUN pip install --upgrade pip  
#RUN pip install setuptools  
# RUN pip install --no-cache-dir -U pip setuptools  
# RUN conda install -c conda-forge conda  
RUN conda install --yes conda  
RUN conda clean --tarballs  
  
# Copy our configuration file  
COPY root/. /  
  
# Define default command.  
CMD ["bash"]  
```

#### Sample 2
```
FROM ubuntu  
RUN sudo add-apt-repository -y ppa:openjdk-r/ppa \  
&& apt-get update \  
&& apt-get install -qqy \  
openjdk-8-jdk \  
&& apt-get autoremove -y \  
&& apt-get clean -yqq \  
&& apt-get autoclean -y \  
&& apt-get autoclean \  
&& apt-get autoremove -y \  
&& rm -rf /var/lib/apt/lists/*  
  
# Add the locale archive to install and extract openshift/bin  
RUN add-apt-repository ppa:geoserver/perforce && \  
apt-get -y update && \  
apt-get -yq install postgresql-client && \  
rm -rf /var/lib/apt/lists/* && \  
rm -rf /usr/share/man/?? && \  
rm -rf /usr/share/man/??_*  
# Download packages  
RUN mkdir /packer-env && \  
cd /packer-deploy && \  
git clone https://github.com/dependencies/pop-docs/get-pip.py && \  
git clone https://github.com/pyopensource/postgres.git && \  
cd popper && \  
git checkout $GOPATH/src/github.com/docker/postgres/build/postgresql.sh  
  
EXPOSE 9443  
ENTRYPOINT ["/docker-entrypoint.sh"]  
CMD ["postgres"]  
```

#### Sample 3
```
FROM phusion/baseimage:0.9.16  
MAINTAINER Docker Education Team <education@docker.com>  
  
# Enable ENV variables  
ENV DEBIAN_FRONTEND noninteractive  
  
RUN apt-get update -y -qq && apt-get update && apt-get install -y wget  
  
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -  
RUN apt-get install -y nodejs  
  
# Copy application.  
COPY . /app  
  
# Copy the current directory contents into the container at /app  
ADD . /app  
  
# Install app dependencies  
RUN npm install --production  
  
# Copy the current directory contents into the container at /app  
ADD . /app  
  
# Install app dependencies  
COPY package.json /app/package.json  
  
# Install app dependencies  
RUN npm install  
  
# Bundle app source  
COPY . /app  
  
EXPOSE 80  
EXPOSE 8080  
ENV PORT 80  
CMD npm start   
```
