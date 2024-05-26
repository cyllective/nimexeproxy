FROM nimlang/nim:1.6.14-ubuntu

RUN apt update 
RUN apt install build-essential gcc-mingw-w64 -y --no-install-recommends

ARG USERID=1000
RUN useradd -m -s /bin/sh -u ${USERID} nim

USER nim
RUN nimble install winim -y

WORKDIR /src
ENTRYPOINT ["/bin/sh", "/src/build.sh"] 