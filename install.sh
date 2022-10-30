#!/usr/bin/env zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install rectangle keepassxc firefox caffeine slack drawio macdown postman --cask
brew install nvm tmux mosh lynx neovim pandoc ranger urlview diff-so-fancy fzf the_silver_searcher gdate
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitignore $HOME/.gitignore
mkdir -p $HOME/.config/tmux
ln -s $(pwd)/tmux.conf $HOME/.config/tmux/tmux.conf
mkdir -p $HOME/.config/nvim
ln -s $(pwd)/vimrc $HOME/.config/nvim/init.vim
ln -s $(pwd)/zshrc $HOME/.zshrc
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
