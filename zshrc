# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYTHONWARNINGS="ignore"
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Aliases
alias ll="ls -alF"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias tf="terraform"
alias ta="terraform apply"
alias ti="terraform init"
alias tp="terraform plan"
alias gproject="gcloud config set project"

# Updating PATH
export PATH=/opt/homebrew/opt/mysql-client@5.7/bin:/opt/homebrew/opt/mongodb-community@3.2/bin:$HOME/bin:/usr/local/bin:$PATH

# My ZSH config
## Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## Environment Config
ZSH_THEME="agnoster"
#ZSH_THEME="bullet-train"
BULLETTRAIN_VIRTUALENV_BG="green"
BULLETTRAIN_VIRTUALENV_FG="black"
BULLETTRAIN_PROMPT_ORDER=(
  context 
  dir
  git
  status
)
plugins=(git zsh-kubectl-prompt)
source $ZSH/oh-my-zsh.sh
function right_prompt() {
  local color="white"

  if [[ "$ZSH_KUBECTL_USER" =~ "admin" ]]; then
    color=red
  fi

  echo "%{$fg[$color]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}"
}
RPROMPT='$(right_prompt)'

# Sourcing fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kubectl autocomplete
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)
