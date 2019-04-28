# A basic apache server. To use either add or bind mount content under /var/www
FROM snapcore/snapcraft:latest

ARG BUILD_USER_ID
ENV BUILD_USER_ID ${BUILD_USER_ID:-1000}


MAINTAINER bun.ch version: 0.1

# install golang 
RUN apt-get update && \
  apt-get install -y \
  autoconf \
  automake \
  bison \
  cmake \
  cpp \
  cpp-5 \
  cpp-doc \
  flex \
  g++ \
  g++-5 \
  g++-5-multilib \
  g++-multilib \
  gcc \
  gcc-5 \
  gcc-5-doc \
  gcc-5-locales \
  gcc-5-multilib \
  gcc-doc \
  gcc-multilib \
  gdb \
  glibc-doc \
  libasan2 \
  libasan2-dbg \
  libatomic1 \
  libatomic1-dbg \
  libc-dev-bin \
  libc6-dev \
  libcc1-0 \
  libcilkrts5 \
  libcilkrts5-dbg \
  libgcc-5-dev \
  libgcc1-dbg \
  libgomp1 \
  libgomp1-dbg \
  libisl15 \
  libitm1 \
  libitm1-dbg \
  liblsan0 \
  liblsan0-dbg \
  libmpc3 \
  libmpfr4 \
  libmpx0 \
  libmpx0-dbg \
  libquadmath0 \
  libquadmath0-dbg \
  libreadline-dev \
  libreadline6-dev \
  libssl-dev \
  libssl-doc \
  libstdc++-5-dev \
  libstdc++-5-doc \
  libstdc++6-5-dbg \
  libtinfo-dev \
  libtool \
  libtsan0 \
  libtsan0-dbg \
  libubsan0 \
  libubsan0-dbg \
  linux-libc-dev \
  make \
  make-doc \
  manpages \
  manpages-dev \
  readline-doc \
  zlib1g-dev \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# install go deps
RUN \
  useradd -u ${BUILD_USER_ID} build

USER "build"
WORKDIR "/build"
VOLUME "/build"
CMD "/usr/bin/snapcraft"
