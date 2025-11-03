PROMPT='%n@%m %~$ '

alias vim="nvim"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

HISTSIZE=1000
SAVEHIST=1000

case `uname` in
  Darwin)
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  Linux)
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ;;
esac
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
