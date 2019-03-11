FROM nvcr.io/nvidia/pytorch:19.01-py3

RUN apt-get update

COPY . /app
WORKDIR /app

CMD ["jupyter", "notebook", "--allow-root", "--ip", "0.0.0.0", "--port", "8989"]
