# syntax=docker/dockerfile:1.3-labs
FROM python:3.10

RUN <<EOF
    apt-get update
    apt-get install -y \
        jq
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF

ADD ./requirements.txt /tmp/requirements.txt
RUN <<EOF
    pip3 install -r /tmp/requirements.txt
EOF

ADD ./src /src
ENTRYPOINT [ "/src/main.sh" ]
