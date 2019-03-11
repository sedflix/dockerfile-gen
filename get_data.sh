#! /bin/bash

wget https://github.com/vsoch/dockerfiles/archive/1.0.0.zip
unzip 1.0.0.zip
rm 1.0.0.zip

find dockerfiles-1.0.0/data -type f -name Dockerfile | xargs cat > all.txt
