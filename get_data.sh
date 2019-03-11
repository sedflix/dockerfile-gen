#! /bin/bash

wget -c https://github.com/vsoch/dockerfiles/archive/1.0.0.zip
unzip 1.0.0.zip
rm 1.0.0.zip

echo "concat all dockerfiles to $PWD/dockerfiles-1.0.0/all.txt"
find dockerfiles-1.0.0/data -type f -name Dockerfile | xargs cat > ./dockerfiles-1.0.0/all.txt

mkdir -p ckp
