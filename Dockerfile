FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa dipendenze
RUN apt-get update && \
    apt-get install -y curl libevent-2.1-7 libutempter0 libncursesw6 && \
    curl -L -o /tmp/tmate.deb https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate_2.4.0_amd64.deb && \
    apt-get install -y /tmp/tmate.deb && \
    rm /tmp/tmate.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia tmate in modalità server
CMD ["tmate", "-F"]
