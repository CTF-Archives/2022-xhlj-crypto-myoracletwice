FROM python:3.10-slim-bullseye
# Randark's permission limit questioning framework
LABEL auther="Randark_JMT"
EXPOSE 9999

# RUN sed -i "s@http://deb.debian.org@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN apt-get update && apt install -y socat

# RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pycryptodome gmpy2 
RUN pip3 install pycryptodome gmpy2

COPY ./src/main.py /
COPY ./docker/bin/docker-entrypoint.sh /

ENTRYPOINT [ "/bin/bash","/docker-entrypoint.sh" ]