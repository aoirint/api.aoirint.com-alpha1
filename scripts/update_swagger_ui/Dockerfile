# syntax=docker/dockerfile:1.3-labs
FROM ubuntu:focal

RUN <<EOF
    apt-get update
    apt-get install -y \
        wget \
        zip \
        unzip \
        rsync
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF

ADD ./src /src
ENTRYPOINT [ "/src/main.sh" ]
