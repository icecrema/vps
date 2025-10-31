FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa le dipendenze necessarie
RUN apt-get update && \
    apt-get install -y \
    curl \
    libevent-2.1-7 \
    libutempter0 \
    libncursesw6 && \
    curl -L -o /usr/local/bin/tmate https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-static-linux-amd64 && \
    chmod +x /usr/local/bin/tmate && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia tmate in modalità server
CMD ["tmate", "-F"]
