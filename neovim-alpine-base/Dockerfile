FROM alpine:latest as builder

MAINTAINER Camilo Bermúdez <camilobermudez85@gmail.com>

ARG NVIM_TAG=v0.3.4

WORKDIR /tmp

# Install build dependencies
RUN apk add --no-cache \
    git \
    wget \
    build-base \
    patch \
    cmake \
    pkgconfig \
    libtool \
    automake \
    autoconf \
    m4 \
    gettext-dev \
    libintl \
    libtermkey-dev \
    libvterm-dev

# Build neovim from source
ENV CMAKE_EXTRA_FLAGS="-DENABLE_JEMALLOC=OFF" \
    CMAKE_BUILD_TYPE="RelWithDebInfo"

RUN git clone https://github.com/neovim/neovim.git \
 && cd neovim \
 && git checkout $NVIM_TAG \
 && make \
 && make install


FROM alpine:latest
 
WORKDIR /tmp

COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/nvim/ /usr/local/share/nvim/
 
# User config
ARG UID="1000"
ARG GID="1000"
ENV UNAME="developer" \
    GNAME="developer" \
    SHELL="/bin/bash" \
    UHOME="/home/developer" \
    WD="/home/developer/wd"

# User
RUN apk --no-cache add sudo \
    && mkdir -p "${UHOME}" \
    && mkdir -p "${WD}" \
    && chown "${UID}":"${GID}" "${UHOME}" \
    && echo "${UNAME}:x:${UID}:${GID}:${UNAME},,,:${UHOME}:${SHELL}" \
    >> /etc/passwd \
    && echo "${UNAME}::17032:0:99999:7:::" \
    >> /etc/shadow \
# No password sudo
#    && echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" \
#    > "/etc/sudoers.d/${UNAME}" \
#    && chmod 0440 "/etc/sudoers.d/${UNAME}" \
    && echo "${GNAME}:x:${GID}:${UNAME}" \
    >> /etc/group

RUN apk add --no-cache \
    libtermkey \
    libintl \
    libvterm \
    libgcc \
    bash

COPY --chown=developer:developer init.vim /home/developer/.config/nvim/
COPY --chown=developer:developer 01-base.vim /home/developer/.config/nvim/init/

USER $UNAME
WORKDIR $WD

ENTRYPOINT ["nvim"]
