FROM i386/ubuntu:20.04

ARG BYOND_MAJOR
ARG BYOND_MINOR

RUN apt-get update && \
    apt-get install -y curl unzip make libstdc++6 && \
    curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip && \
    unzip byond.zip && \
    cd byond && \
    sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile && \
    make install && \
    apt-get purge -y --auto-remove curl unzip make && \
    cd .. && \
    rm -rf byond byond.zip /var/lib/apt/lists/*