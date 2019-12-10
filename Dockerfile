FROM debian:unstable-slim
LABEL maintainer=d-nice2@protonmail.com
LABEL version=0.1.0

RUN set -ex \
  && apt update \
  && apt install \
          #--no-install-recommends \
          --no-upgrade \
          -y curl \
             neovim \
             git \
             xclip \
  && curl -sL install-node.now.sh/lts | bash -s -- -y \
  && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://gist.githubusercontent.com/D-Nice/ff46f77e490300e464bf7b696db5f8d4/raw/509f7bbbe183952d629306ff842e572f62e5d86a/init.vim \
  && nvim --headless \
            +PlugInstall \
            +qa \
  && nvim --headless +CocUpdateSync \
  # let's give her 2 minutes to finish installing...
  # TODO find more elegant way?
  & sleep 120 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/nvim

ENTRYPOINT ["nvim"]
