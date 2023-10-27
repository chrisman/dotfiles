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

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${HOME}/bin:${HOME}/Library/Python/3.8/bin:${HOME}/.luarocks/bin"
# export MANPATH="/usr/local/man:$MANPATH"

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
# export ARCHFLAGS="-arch x86_64"

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
alias love="/Applications/love.app/Contents/MacOS/love"
alias tic80="/Applications/tic80.app/Contents/MacOS/tic80"
alias fnl=fennel
alias moon='curl --fail -s "https://wttr.in/moon"'
alias wttr='curl --fail -s "https://wttr.in"'
alias please=sudo
alias bkgm='rlwrap telnet fibs.com 4321'
alias sus='rlwrap nc sus.tildeverse.org 1234'
#alias docker=podman
#alias pod=podman
#alias docker-compose=podman-compose
alias wordle='ssh clidle.ddns.net -p 3000'
alias date=gdate # brew install gdate
alias tt=tt++
alias v=nvim
alias retro='rlwrap retro'
alias j=just
alias cat=bat
alias fl='rlwrap fennel'
alias fennel='rlwrap fennel'
alias ss="cat package.json | jq -r '.scripts | keys[]' | fzf | xargs npm run"
alias j=just
alias jj="just --choose"
alias nb=newsboat
alias ed='rlwrap ed'
alias sc=sc-im

# vim keys in zsh
bindkey -v

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# neovim!
alias vim=nvim
alias vimdiff="nvim -d"

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

# python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias py=python

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# markdown
function rmd {
  pandoc $@ | lynx -stdin
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -t f -E Library -E workspace -E go'
export FZF_DEFAULT_OPTS="--layout=reverse --multi --border --height=100 --preview='bat --color=always --line-range :50 {}'"
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

PATH="/Users/cb/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/cb/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/cb/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/cb/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/cb/perl5"; export PERL_MM_OPT;
