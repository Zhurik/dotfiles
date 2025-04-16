[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export KUBECONFIG=~/.kube/config

export GOPRIVATE=*.sbercloud.tech,*.sbercloud.dev
export GONOPROXY="*.sbercloud.tech,*.sbercloud.dev"
export GONOSUMDB="*.sbercloud.tech,*.sbercloud.dev"

export PATH=/usr/local/bin/code:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

fpath+=~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry
autoload -Uz compinit
compinit
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

source ~/.zsh_plugins/fzf-tab/fzf-tab.plugin.zsh

# Фикс CTRL+L на MacOS
function clear-scrollback-buffer {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}
zle -N clear-scrollback-buffer
bindkey '^L' clear-scrollback-buffer

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd $realpath'

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.aliases ] && source $HOME/.aliases

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval $(thefuck --alias)

pfetch
