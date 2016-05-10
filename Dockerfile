FROM alpine:3.3
MAINTAINER Jason Strothmann <strothjs@gmail.com>

ENV PATCHELF_VER=0.9 \
    PATCHELF_URL=https://github.com/NixOS/patchelf/archive/
RUN apk add --no-cache autoconf automake build-base ca-certificates && \
    wget ${PATCHELF_URL}${PATCHELF_VER}.tar.gz && \
    tar -xzf ${PATCHELF_VER}.tar.gz && \
    rm ${PATCHELF_VER}.tar.gz && \
    cd patchelf-${PATCHELF_VER} && \
    ./bootstrap.sh && \
    ./configure --prefix=/usr && \
    make && \
    mkdir /build && \
    make install DESTDIR=/build && \
    apk del autoconf automake build-base ca-certificates && \
    cd /build && \
    tar -czf ${PATCHELF_VER}.tar.gz usr/ && \
    rm -rf /build/usr /patchelf-${PATCHELF_VER}
CMD ["/bin/true"]