PROMPT='%n@%m %~$ '

alias vim="nvim"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=2000
SAVEHIST=2000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

bindkey -e

setopt nobeep

autoload -Uz compinit

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"


case `uname` in
  Darwin)
    source <(fzf --zsh)
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  Linux)
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
esac
