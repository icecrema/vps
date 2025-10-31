FROM ubuntu:20.04

LABEL maintainer="tuo_nome <tuo@email.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna e installa tmate
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:tmate.io/archive && \
    apt-get update && \
    apt-get install -y tmate && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia tmate in modalità server
CMD ["tmate", "-F"]
