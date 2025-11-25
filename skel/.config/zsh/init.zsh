#!/bin/zsh

mkdir -p $HOME/.config

# Setup neovim
NEOVIM_CONFIG=$HOME/.config/nvim
if [ ! -d $NEOVIM_CONFIG ];then
  echo -e "\e[92mSetting up Neovim\e[0m"
  git clone https://github.com/ipedrohenrick/nvim.lua.git $NEOVIM_CONFIG \
    && sudo npm install -g neovim
fi

# Setup tmux
TMUX_CONFIG=$HOME/.tmux.conf
if [ ! -f $TMUX_CONFIG ];then
  echo -e "\e[95mSetting up tmux\e[0m"
  cp $DEVBOX_CONFIG/files/tmux.conf $TMUX_CONFIG
fi

TMUX_PLUGINS=$HOME/.tmux/plugins
mkdir -p $TMUX_PLUGINS
if [ ! -d $TMUX_PLUGINS/tpm ];then
  echo -e "\e[95mInstalling TPM tmux\e[0m"
  git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS/tpm \
    && $TMUX_PLUGINS/tpm/bin/install_plugins
fi
if [ ! -d $TMUX_PLUGINS/catppuccin ];then
  echo -e "\e[95mInstalling catppuccin tmux theme\e[0m"
  mkdir -p $TMUX_PLUGINS/catppuccin
  git clone -b v2.1.3 https://github.com/catppuccin/tmux.git $TMUX_PLUGINS/catppuccin/tmux
fi
