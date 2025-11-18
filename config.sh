#/bin/sh

mkdir -p $HOME/.config

# Config neovim
git clone https://github.com/ipedrohenrick/nvim.lua.git $HOME/.config/nvim \
  && npm install -g neovim

# Config tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm \
  && $HOME/.tmux/plugins/tpm/bin/install_plugins

# Config starship
starship preset catppuccin-powerline > $HOME/.config/starship.toml
cp /tmp/files/.zshrc $HOME

# Setup zsh to default shell
chsh -s /bin/zsh
