FROM camilobermudez/neovim-alpine-base:latest
 
USER root

COPY --chown=developer:developer init/10-plugins.vim /home/developer/.config/nvim/init/

# Install python2, python3, ruby and nodejs providers
# Intallation dependencies
RUN apk add --no-cache --virtual install-deps \
    build-base \
    musl-dev \
    py2-pip \
    python-dev \
    python3-dev \
    ruby-dev \
    git \
# Nodejs and ack.vim installation and runtime dependencies
 && apk add --no-cache \
    nodejs \
    npm \
    ack \
# Install python providers
 && pip2 install --upgrade pynvim \
 && pip3 install --upgrade pynvim \
# Install ruby provider
 && gem install neovim --no-document \
# Install nodejs provider
 && npm install -g neovim \
# Install Plug plugin manager
 && mkdir -p ${UHOME}/.local/share/nvim/site/autoload \
 && wget -P ${UHOME}/.local/share/nvim/site/autoload \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
 && chown -R ${UNAME}:${GNAME} ${UHOME}/.local/share/nvim \
# Install all the plugins configured in the init files
 && su ${UNAME} -c 'nvim -c "PlugInstall|q|q"' \
# Clean up
 && apk del install-deps \
# Install runtime dependencies
 && apk add --no-cache \
    xclip \
# Python 2 provider runtime dependencies
    python \
# Python 3 provider runtime dependencies
    python3 \
# Ruby provider runtime dependencies
    ruby \
# Other dependencies
    git

USER $UNAME

# Copy remaining init files
COPY --chown=developer:developer init/*.vim /home/developer/.config/nvim/init/

WORKDIR $WD
