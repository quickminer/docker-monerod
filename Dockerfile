# Requires docker 17.05

# Run sample docker run --restart unless-stopped -d --name monerod -p 18082:18081 --mount type=bind,source=/media/data01/monerodata,target=/monerodata docker-monerod
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
    language-pack-en-base \
    ca-certificates \
    bzip2 \
    wget && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8

# blockchain volume data
VOLUME /monerodata

## download && extrack & chmod
RUN wget https://github.com/monero-project/monero/releases/download/v0.12.3.0/monero-linux-x64-v0.12.3.0.tar.bz2 -P /monerod/ && \
    tar -xvjf /monerod/monero-linux-x64-v0.12.3.0.tar.bz2 -C /monerod && \
    chmod +x /monerod/monero-v0.12.3.0/monerod


# Contains the blockchain
VOLUME /monerodata

# Generate your wallet via accessing the container and run:
# cd /wallet
# monero-wallet-cli


EXPOSE 18080
EXPOSE 18081
ENTRYPOINT ["/monerod/monero-v0.12.3.0/monerod", "--p2p-bind-ip=0.0.0.0", "--p2p-bind-port=18080", "--rpc-bind-ip=0.0.0.0", "--rpc-bind-port=18081", "--non-interactive", "--data-dir=/monerodata/.bitmonero", "--confirm-external-bind"]
