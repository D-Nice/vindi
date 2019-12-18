FROM debian:unstable-slim
LABEL maintainer=d-nice2@protonmail.com
LABEL version=0.1.0

# Add initial config
COPY ./etc/init /root

# Setup vim container
RUN set -ex \
  && apt update \
  && apt install \
          --no-upgrade \
          -y curl \
             neovim \
             git \
             xclip \
  || (echo "FAILED" && exit 1) \
  && curl -sL install-node.now.sh/lts | bash -s -- -y \
  && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  # TODO consider running with PlugClean if no prompt version available
  && nvim --headless \
            +PlugInstall \
            +qa \
  && nvim --headless +CocUpdateSync \
  # TODO find more elegant way over 2 minute sleep
  & sleep 120 \
  && rm -rf /var/lib/apt/lists/* 

# post-install patch
COPY ./etc/patch /root

WORKDIR /opt/vindi

ENTRYPOINT ["nvim"]
