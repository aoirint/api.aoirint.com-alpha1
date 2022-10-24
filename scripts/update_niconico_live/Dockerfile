# syntax=docker/dockerfile:1.3-labs
FROM python:3.10

RUN <<EOF
    apt-get update
    apt-get install -y \
        gosu
    apt-get clean
    rm -rf /var/lib/apt/lists/*
EOF

RUN <<EOF
    groupadd -o -g 1000 user
    useradd -o -u 1000 -g user -m user
EOF

ADD ./requirements.txt /tmp/requirements.txt
RUN <<EOF
    gosu user pip3 install -r /tmp/requirements.txt
EOF

ADD ./src /src
ENTRYPOINT [ "gosu", "user", "python3", "/src/main.py" ]
