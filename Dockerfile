FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa tutte le dipendenze necessarie
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libevent-dev \
    libncurses-dev \
    libutempter-dev \
    pkg-config \
    git \
    cmake \
    curl \
    automake \
    autoconf && \
    git clone https://github.com/tmate-io/tmate.git /tmate && \
    cd /tmate && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia tmate in modalità server
CMD ["tmate", "-F"]
