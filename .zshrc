export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/bin



export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

source $HOME/.zsh/completion.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/aliases.zsh
# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# See https://github.com/peterhurford/git-aliases.zsh
alias gco='git checkout'
alias restartc='docker compose --profile celery restart'
alias down='just down'
alias up='just up'
alias upc='docker compose --profile celery up -d'
alias downc='docker compose --profile celery down'
alias k='kubectl'
alias gf='git fetch'
alias gb='git branch'
alias unmerged="git branch --no-merged"
alias plog="git log --oneline --decorate"
alias s='git status'
alias squash='git reset $(git merge-base main $(git rev-parse --abbrev-ref HEAD))'
alias vim=nvim
alias update='git checkout main && git pull && git checkout - && git rebase main && git push --force-with-lease'


export PATH="$(yarn global bin):$PATH"
# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"