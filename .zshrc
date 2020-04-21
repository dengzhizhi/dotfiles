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
promptinit
prompt kylewest
# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'


export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger
#export GO111MODULE=on
export GOPATH=~/dev/go

alias ledger_default="export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger"
 
export PATH="/Users/zdeng/.local/bin:/Users/zdeng/bin/nvim/0.8.2/bin:/Users/zdeng/bin:$JAVA_HOME/bin:/Applications/MacVim.app/Contents/bin:$PATH"

alias vim1="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=1'"
alias vim2="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=2'"
alias vim3="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=3'"
alias vim4="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=4'"
alias vim5="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=5'"

export EDITOR="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=3' --cmd 'let g:autocomplete_level=2'"
export VISUAL="/Users/zdeng/bin/nvim/0.8.2/bin/nvim --cmd 'let g:ide_level=3' --cmd 'let g:autocomplete_level=2'"
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs


export EDITOR=nvim
export VISUAL=nvim
export PAGER="less -RF"
export BAT_PAGER="less -RF"
#export PAGER='nvim -R -u ~/.config/nvim/init.pg.vim -'

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
# Also C-x C-i to edit the current command line (easier to input)
bindkey '\C-x\C-i' edit-command-line

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Highlight search results in ack.
export ACK_COLOR_MATCH='red'

# Activate the closest virtualenv by looking in parent directories.
activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

# Find the directory of the named Python module.
python_module_dir () {
    echo "$(python3 -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# By @ieure; copied from https://gist.github.com/1474072
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
function up()
{
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

# Switch projects
function p() {
    local proj
    proj=$(ls ~/proj | selecta)
    if [[ -n "$proj" ]]; then
        cd ~/proj/$proj
        if [[ -e "Gemfile" ]]; then
            local ruby_version
            ruby_version=$(ruby -ne $'print $1 if $_ =~ /ruby [\'"]([0-9.]+)[\'"]/' Gemfile)
            chruby "$ruby_version"
            gem_home .
        fi
        if [[ -d ~/secrets/$proj ]]; then
            . ~/secrets/$proj/secrets.sh
        fi
    fi
}

# Edit a note
function note() {
    local note=$(find ~/notes/* | selecta)
    if [[ -n "$note" ]]; then
        (cd ~/notes && vim "$note")
    fi
}

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run Selecta in the current working directory, appending the selected path, if
# any, to the current command.
function insert-selecta-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(fd -t f . | selecta) || return
    # Escape the selected path, since we're inserting it into a command line.
    # E.g., spaces would cause it to be multiple arguments instead of a single
    # path argument.
    selected_path=$(printf '%q' "$selected_path")
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path "'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}
# Create the zle widget
zle -N insert-selecta-path-in-command-line
# Bind the key to the newly created widget
bindkey "^S" "insert-selecta-path-in-command-line"


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

# emacs
alias e='emacs -nw'

#tig
alias gst="tig status"

# lazygit
alias lg="lazygit"


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
switchjava 11

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

export PATH="/usr/local/opt/util-linux/bin:$PATH"

export PATH="$HOME/.npm-packages/bin:$PATH"

# lua-language-server
export PATH="$HOME/tools/lua-language-server/bin:$PATH"

# clangd
export PATH="/usr/local/Cellar/llvm/13.0.1_1/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

eval "$(fnm env --use-on-cd)"

# Put the default buffer in vim into scratch mode, good for piping outputs
alias svim="vim -c \"setl bt=nofile bh=wipe nobl noswf nomodifiable\""
source /Users/zdeng/.config/broot/launcher/bash/br
alias zh='z -I -t .' # go to history stack
alias zz='z -c'      # restrict matches to subdirs of $PWD
alias zi='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directory
# cq alias
alias cqq="cq -o json --no-pretty "


# Sublime Text CLI
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
