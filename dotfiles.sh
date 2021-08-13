ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore ~/.gitignore
mkdir -p ~/.config/tmux
ln -s $(pwd)/tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/nvim
ln -s $(pwd)/vimrc ~/.config/nvim/init.vim
ln -s $(pwd)/zshrc ~/.zshrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
