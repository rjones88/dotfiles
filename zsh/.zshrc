## Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# or if using default npm global path:
export PATH="$HOME/.local/bin:$PATH"
# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Aliases
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias v='nvim'
alias reload='source ~/.zshrc'
alias ezsh='v ~/.zshrc'

# Starship
eval "$(starship init zsh)"
