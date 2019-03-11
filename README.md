# Dockerfile Generator 
Generates random Dockerfile using char-rnn

## Usage

### Pre-reqs

Dependencies:
- pytorch
- numpy
- jupyter
- docker/nvidia-docker(optional)

You are requied to clone the the directory and build a docker image. The current dockerfile is unoptimised.
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
