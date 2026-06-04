export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

unset zle_bracketed_paste

eval "$(starship init zsh)"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export QT_XCB_GL_INTEGRATION=none

export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:$HOME/.dotnet/tools"
