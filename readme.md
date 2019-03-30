# nghttp2 docker image

[![](https://images.microbadger.com/badges/version/centminmod/docker-ubuntu-nghttp2-minimal.svg)](https://microbadger.com/images/centminmod/docker-ubuntu-nghttp2-minimal "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/centminmod/docker-ubuntu-nghttp2-minimal.svg)](https://microbadger.com/images/centminmod/docker-ubuntu-nghttp2-minimal "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/centminmod/docker-ubuntu-nghttp2-minimal.svg)](https://microbadger.com/images/centminmod/docker-ubuntu-nghttp2-minimal "Get your own commit badge on microbadger.com")

A [minimalistic nghttp2 docker image](https://hub.docker.com/r/centminmod/docker-ubuntu-nghttp2-minimal) using Ubuntu 19.0.4 native [nghttp2](https://github.com/nghttp2/nghttp2) and testssl.sh apt packages for much smaller docker image size instead of source compiled nghttp2 version in [docker-ubuntu-nghttp2](https://www.github.com/centminmod/docker-ubuntu-nghttp2) docker image (which includes other tools). This minimalistic nghttp2 docker image currently installs nghttp 1.36 while the source compiled nghttp2 docker image source compiles latest nghttp2 version - 1.38.

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

Run h2load HTTP/2 HTTPS load tests against Centmin Mod Nginx HTTP/2 HTTPS TLS 1.3 supported server

```
nghttpcmd-min h2load -t1 -c100 -n1000 https://centminmod.com
starting benchmark...
spawning thread #0: 100 total client(s). 1000 total requests
TLS Protocol: TLSv1.3
Cipher: TLS_AES_256_GCM_SHA384
Server Temp Key: X25519 253 bits
Application protocol: h2
progress: 10% done
progress: 20% done
progress: 30% done
progress: 40% done
progress: 50% done
progress: 60% done
progress: 70% done
progress: 80% done
progress: 90% done
progress: 100% done

finished in 361.95ms, 2762.78 req/s, 116.86MB/s
requests: 1000 total, 1000 started, 1000 done, 1000 succeeded, 0 failed, 0 errored, 0 timeout
status codes: 1000 2xx, 0 3xx, 0 4xx, 0 5xx
traffic: 42.30MB (44353626) total, 99.34KB (101726) headers (space savings 88.58%), 42.13MB (44175000) data
                     min         max         mean         sd        +/- sd
time for request:     7.70ms     66.99ms     22.95ms     13.08ms    82.20%
time for connect:    18.03ms    123.57ms     73.35ms     30.97ms    57.00%
time to 1st byte:    77.81ms    155.80ms    123.33ms     26.42ms    55.00%
req/s           :      28.59       37.00       33.10        1.81    67.00%
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