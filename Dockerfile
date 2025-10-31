FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installa curl e tar
RUN apt-get update && \
    apt-get install -y curl tar && \
    curl -L https://sshx.s3.amazonaws.com/sshx-x86_64-unknown-linux-musl.tar.gz -o /tmp/sshx.tar.gz && \
    tar -xzf /tmp/sshx.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/sshx && \
    rm /tmp/sshx.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Avvia sshx
CMD ["sshx"]
