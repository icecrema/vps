FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa dipendenze minime
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L -o /usr/local/bin/sshx https://github.com/moul/sshx/releases/download/v1.0.0/sshx_linux_amd64 && \
    chmod +x /usr/local/bin/sshx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia sshx (modifica secondo il tuo uso)
CMD ["sshx"]
