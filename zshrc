# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunaku"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${HOME}/bin:${HOME}/.local/bin:${HOME}/.luarocks/bin:/usr/local/opt/openssl/bin:/Users/cb/Library/Python/3.9/bin"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases
#alias docker-compose=podman-compose
#alias docker=podman
alias bkgm='rlwrap telnet fibs.com 4321'
alias cat=bat
alias date=gdate # brew install gdate
alias ed='rlwrap ed'
alias fennel='rlwrap fennel'
alias fl='rlwrap fennel'
alias fnl='rlwrap fennel'
alias ghostconfig="v ~/Library/Application\ Support/com.mitchellh.ghostty/config"
alias glv="glo | tac | vim -R -c 'set filetype=git' -"
alias ip="ifconfig | grep -o 'inet 192.168.0.\d\{3\}' | cut -d' ' -f2"
alias j=just
alias jc="just --choose"
alias love="/Applications/love.app/Contents/MacOS/love"
alias moon='curl --fail -s "https://wttr.in/moon"'
alias nb=newsboat
alias nc=ncat
alias please=sudo
alias pod=podman
alias py=python
alias r=ranger
alias retro='rlwrap retro'
alias sc=sc-im
alias sql=sqlite3
alias ss="cat package.json | jq -r '.scripts | keys[]' | fzf --preview="" | xargs npm run"
alias sus='rlwrap nc sus.tildeverse.org 1234'
alias t="todo"
alias tab="jj ~/tables/justfile"
alias tb="nc termbin.com 9999"
alias tic80="/Applications/tic80.app/Contents/MacOS/tic80"
alias tt=tt++
alias v=nvim
alias vim=nvim
alias vimdiff="nvim -d"
alias wordle='ssh clidle.ddns.net -p 3000'
alias wttr='curl --fail -s "https://wttr.in"'

# vim keys in zsh
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# suffix aliases!
alias -s js=vim
alias -s git="git clone" # 😎

# open git repo
# is a function because i couldn't ever escape all the quotes correctly
# is named `gx` to mirror the vim command. see `:help gx`
gx () {
  git remote -v | awk '{print $2}' | sed 's/git@/http:\/\//' | sed 's/com:/com\//' | head -n1 | xargs open
}

# tmux-send
function ts {
  args = $@
  tmux send-keys -t right "$args" C-m
}

# markdown
function rmd {
  pandoc $@ | w3m -T text/html
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -t f -E Library -E workspace -E go'
export FZF_DEFAULT_OPTS="--layout=reverse --multi --border --height=100 --preview='bat --color=always --line-range :50 {}'"
export FZF_CTRL_R_OPTS="--layout=reverse --border --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_COMMAND='fd -t d -H -L -E Library -E workspace -E go -E .git'
export FZF_ALT_C_OPTS="--layout=reverse --height=100 --border --preview='tree -C {} | head -50'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"

export EDITOR=nvim

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# starship
eval "$(starship init zsh)"

# binutils
export PATH="/usr/local/opt/binutils/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/binutils/lib"
export CPPFLAGS="-I/usr/local/opt/binutils/include"

# better man pager
export MANPAGER='nvim +Man!'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
