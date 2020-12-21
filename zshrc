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

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${HOME}/bin:${HOME}/Library/Python/3.8/bin"
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
alias fnl=fennel

# rip docker
#alias docker="podman"
#alias docker-compose="podman-compose"

# vim keys in zsh
bindkey -v

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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

# markdown
function rmd {
  pandoc $@ | lynx -stdin
}


# Signatry Aliases
## Docker
alias death2docker='echo "DEATH TO DOCKER" && docker stop $(docker ps -q -a) && echo "DOCKER HAS BEEN STOPPED"  && docker system prune --volumes && echo "DOCKER IS DEAD, AND THE VILLAGE REJOICES" ' 
# The Signatry Commands
alias ts-api="cd ${HOME}/workspace/signatry/graphql-api && dotenv -e ../.env -- npx ts-node-dev --transpile-only --ignore-watch node_modules src/index.ts"
alias ts-client="cd ${HOME}/workspace/signatry/react-client && dotenv -e ../.env -- npm run dev"
alias ts-restore="cd ${HOME}/workspace/signatry && dotenv ./database/scripts/restore.sh && cd ../.."
alias ts-reset="cd ${HOME}/workspace/signatry && dotenv ./database/scripts/reset.sh && cd ../.."
alias ts-startup="cd ${HOME}/workspace/signatry && dotenv ./database/scripts/reset.sh && dotenv ./database/scripts/restore.sh && cd ./graphql-api && dotenv -e ../.env npx typeorm migration:run && cd ../../.."
alias ts-build="cd ${HOME}/workspace/signatry/graphql-api && npm run build:watch"
alias ts-migrate="cd ${HOME}/workspace/signatry/graphql-api && dotenv -e ../.env npx typeorm migration:run && cd ../../.."
alias ts-revert="cd ${HOME}/workspace/signatry/graphql-api && dotenv -e ../.env npx typeorm migration:revert && cd ../../.."
alias ts-stripe="cd ${HOME}/workspace/signatry/graphql-api && stripe listen --forward-to localhost:8080/api/stripe"
alias ts-db="docker ps -a && docker stop signatry_devcontainer_vscode_1"
alias ts-clean="cd ${HOME}/workspace/signatry/graphql-api/dist/ && rm -rfv ./* && cd"
