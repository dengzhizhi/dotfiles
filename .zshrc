#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.2+9/Contents/Home
export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger
#export GO111MODULE=on
export GOPATH=~/dev/go

alias ledger_default="export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger"
alias ledger_usana="export LEDGER_FILE=~/Dropbox/ledger/usana.ledger"
 
export PATH="/Users/zdeng/go/bin:/Users/zdeng/.local/bin:/Users/zdeng/bin:$JAVA_HOME/bin:$PATH"


export EDITOR=nvim
export VISUAL=nvim
export PAGER="less -RF"
export BAT_PAGER="less -RF"
#export PAGER='nvim -R -u ~/.config/nvim/init.pg.vim -'

alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"
alias ccat="pygmentize -g"
alias dc="docker-compose"

alias glog="git log | bat"

alias gradle=gw
alias gcat='(gw clean assemble testClasses && say finished) || say error'
alias gat='(gw assemble testClasses && say finished) || say error'
alias ga='(gw assemble && say finished) || say error'
alias gp="gw \$(gw projects | sed \"s/.*\'\(.*\)\'.*/\1:assemble/g\" | grep assemble | fzf)"

# gradle
alias gwca='gw clean assemble'
# frontend_build just takes too much time
alias gwjava='gw assemble --exclude-task frontend_build'
# check both main and test compiles and checkstyle is ok, almost like gw build but without running tests
alias gwcheck='gw assemble testClasses checkstyleMain checkstyleTest'
# same but don't run frontend_build
alias gwjcheck='gwjava testClasses checkstyleMain checkstyleTest'

# enhancements
alias ping='prettyping'
alias vim=nvim
alias vi=/usr/local/bin/vim
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

#tig
alias gst="tig status"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTFILE=~/.zhistory
export HISTCONTROL=ignoreboth:erasedups
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# fd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# Switch java version
function switchjava() {
    export JAVA_HOME=`/usr/libexec/java_home -v $1`
    echo "JAVA_HOME switched to $JAVA_HOME"
}

#lesspipe

# sets LESSOPEN and LESSCLOSE variables
eval "$(SHELL=/bin/sh lesspipe.sh)"

export LESSOPEN="|$(brew --prefix)/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# interpret color characters
export LESS='-R'

# to list available styles: `pygmentize -L styles`
export PYGMENTIZE_STYLE='paraiso-dark'

# eval $(thefuck --alias)


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/zdeng/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/zdeng/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/zdeng/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/zdeng/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
export PATH="/usr/local/opt/ncurses/bin:$PATH"

source /Users/zdeng/.ghcup/env
eval `opam config env`

switchjava 11
