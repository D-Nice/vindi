FROM debian:testing-slim
LABEL maintainer=d-nice2@protonmail.com

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add initial config
COPY ./etc/init /root

# Setup vim container
RUN set -ex \
  && apt-get update \
  && apt-get install \
          --no-upgrade \
          -y curl \
             neovim \
             git \
             xclip \
             gcc \
             shellcheck \
  && rm -rf /var/lib/apt/lists/* 

RUN set -ex \
  && curl -sL install-node.now.sh/lts | bash -s -- -y \
  && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  # TODO consider running with PlugClean if no prompt version available
  && nvim --headless \
            +PlugInstall \
            +qa \
  && nvim --headless +CocUpdate \
  # TODO find more elegant way over 2 minute sleep
  & sleep 300 \
  && rm -rf /root/.npm/_cacache

ENV PATH="/root/.nimble/bin:${PATH}"
RUN set -ex \
  && curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y \
  && nimble install nimlsp -y \
  && rm -rf /root/.choosenim/toolchains/nim-*/c_code

# post-install patch
COPY ./etc/patch /root

WORKDIR /opt/vindi

ENTRYPOINT ["nvim"]
