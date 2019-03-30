# nghttp2 docker image

A [minimalistic nghttp2 docker image](https://hub.docker.com/r/centminmod/docker-ubuntu-nghttp2-minimal) using Ubuntu 19.0.4 native nghttp2 and testssl.sh apt packages for much smaller docker image size instead of source compiled nghttp2 version in [docker-ubuntu-nghttp2](https://www.github.com/centminmod/docker-ubuntu-nghttp2) docker image (which includes other tools). This minimalistic nghttp2 docker image currently installs nghttp 1.36 while the source compiled nghttp2 docker image source compiles latest nghttp2 version - 1.38.

# command alias shortcuts

You can add some command alias shortcuts to `/root/.bashrc` for convenience sake.

Pull and run `centminmod/docker-ubuntu-nghttp2-minimal` docker image and name it `nghttp-min` and stop and remove any existing docker container named `nghttp-min` first.

```
alias rmnghttp-min='docker stop nghttp-min; docker rm nghttp-min; docker rmi centminmod/docker-ubuntu-nghttp2-minimal; docker run -ti --net=host --name nghttp-min centminmod/docker-ubuntu-nghttp2-minimal /bin/bash'
```

Run `nghttpcmd-min` from within docker host commands within `nghttp-min` named docker container

```
alias nghttpcmd-min='docker exec -ti nghttp-min'
```

Examples

```
nghttpcmd-min h2load --version
h2load nghttp2/1.36.0
```

```
nghttpcmd-min nghttp --version
nghttp nghttp2/1.36.0
```

```
nghttpcmd-min openssl version -a
OpenSSL 1.1.1b  26 Feb 2019
built on: Wed Feb 27 23:13:17 2019 UTC
platform: debian-amd64
options:  bn(64,64) rc4(16x,int) des(int) blowfish(ptr) 
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -Wa,--noexecstack -g -O2 -fdebug-prefix-map=/build/openssl-BlCeg6/openssl-1.1.1b=. -fstack-protector-strong -Wformat -Werror=format-security -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPADLOCK_ASM -DPOLY1305_ASM -DNDEBUG -Wdate-time -D_FORTIFY_SOURCE=2
OPENSSLDIR: "/usr/lib/ssl"
ENGINESDIR: "/usr/lib/x86_64-linux-gnu/engines-1.1"
Seeding source: os-specific
```

Run `nghttprun-min` to enter into docker image container named `nghttp-min` via SSH interactive bash

```
alias nghttprun-min='docker exec -ti nghttp-min /bin/bash'
```

Clean up & remove all docker images and containers

```
alias dockerrm-all-min='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)'
alias rmdockuntagimg-min='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
```