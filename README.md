# alpine-patchelf
From the [patchelf repository](https://github.com/NixOS/patchelf):
> PatchELF is a simple utility for modifing existing ELF executables and
libraries.

This repository contains binary releases for use in Alpine Linux.  
Its intention is to make it easier to pull in the utility for use in Docker containers.

The binary package is available here:  
https://github.com/strothj/alpine-patchelf/releases

## Usage Example
```dockerfile
FROM alpine:3.3
RUN apk add --no-cache ca-certificates && \
    wget https://github.com/strothj/alpine-patchelf/releases/download/0.9/0.9.tar.gz && \
    tar -C / -xzf 0.9.tar.gz && rm 0.9.tar.gz && \
    patchelf --version && \
    rm -rf /usr/bin/patchelf /usr/share/doc/patchelf /usr/share/man/man1/patchelf.*
```