FROM ubuntu:20.04

RUN apt-get clean

WORKDIR /app

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends --fix-missing build-essential g++ clang pkg-config zip make 

COPY . /app

RUN make

ENTRYPOINT [ "/app/ptftool" ]


## build:
# docker build -t ptformat:latest .

## run:
# docker run --rm -v "$PWD:$PWD" -w "$PWD" ptformat:latest <PROTOOLS_SESSION.PTX>