# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Initialize completion
# setopt PROMPT_SUBST
# autoload -U compinit
# compinit -D
# prompt kylewest
promptinit

# Colorize terminal
# alias ls='exa --icons'
alias ll='exa --tree --long --icons --group-directories-first --level=1'
# alias lll='exa --tree --long --icons --group-directories-first --color=always --level=3 | less'
function lll() {
    exa --tree --long --icons --group-directories-first --color=always --level=3 $@ | less
}

# export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
# export GREP_OPTIONS="--color"

# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'

# Prevent ctrl-d killing the shell
set -o ignoreeof

export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger
#export GO111MODULE=on
#export GOPATH=~/dev/go

alias ledger_default="export LEDGER_FILE=~/Dropbox/ledger/default_en.ledger"
export PATH="$HOME/.local/bin:$HOME/bin/nvim/0.10.1/bin:$HOME/bin:$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$JAVA_HOME/bin:/Applications/MacVim.app/Contents/bin:$PATH"
export NEOVIM_BIN="/Users/zdeng/bin/nvim/0.10.1/bin/nvim"

alias nvimc="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:enable_coc=1'"
alias nvim0="$HOME/bin/nvim/0.10.1/bin/nvim"
alias nvim1="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=1'"
alias nvim2="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=2'"
alias nvim3="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=3'"
alias nvim4="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=4'"
# alias nvim5="$HOME/bin/nvim/0.9.5/bin/nvim --cmd 'let g:ide_level=5'"
# nvim5 is defined in ~/bin so that can be used in EDITOR and VISUAL
alias nvim6="nvim-mini"

alias nvim91="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=1'"
alias nvim92="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=2'"
alias nvim93="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=3'"
alias nvim94="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=4'"
alias nvim95="$HOME/bin/nvim/0.10.1/bin/nvim --cmd 'let g:ide_level=5'"


alias nvim-astro="NVIM_APPNAME=AstroNvim $HOME/bin/nvim/0.10.1/bin/nvim"
alias nvim-lazy="NVIM_APPNAME=LazyNvim $HOME/bin/nvim/0.10.1/bin/nvim"
alias nvim-nvchad="NVIM_APPNAME=NvChad $HOME/bin/nvim/0.10.1/bin/nvim"
alias nvim-kickstart="NVIM_APPNAME=KickstartNvim $HOME/bin/nvim/0.10.1/bin/nvim"
alias nvim-jdhao="NVIM_APPNAME=JdhaoNvim $HOME/bin/nvim/0.10.1/bin/nvim"
function nvim-mini() {
    NVIM_APPNAME=MiniNvim /Users/zdeng/bin/nvim/0.10.1/bin/nvim $@
}

# ask local AI
alias ai-llama="ollama run llama3.1:8b-instruct-q4_1"
alias ai-mistral="ollama run mistral-nemo:12b-instruct-2407-q8_0"
alias ai-qwen="ollama run qwen2:7b-instruct-q8_0"
alias ai-phi="ollama run phi3:14b-medium-128k-instruct-q5_1"
alias ai-deepseekcoder="ollama run deepseek-coder-v2:16b-lite-instruct-q4_1"
alias askai="ollama run llama3.1:8b-instruct-q4_1"

function nvims() {
    items=("default" "AstroNvim" "LazyNvim" "NvChad" "KickstartNvim" "JdhaoNvim" "MiniNvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME=$config /Users/zdeng/bin/nvim/0.10.1/bin/nvim $@
}


export EDITOR="nvim4"
export VISUAL="nvim4"
# GNU Screen sets -o vi if EDITOR=vi, so we have to force it back.
set -o emacs

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
alias gg="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"
alias ccat="pygmentize -g"
alias dc="docker-compose"

alias glog="git log | bat"

# enhancements
alias ping='prettyping'
alias vim=/Users/zdeng/bin/nvim/0.10.1/bin/nvim
alias vi=/usr/local/bin/vim
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias no-color="perl -pe 's/\\e\\[?.[0-9;]*[a-zA-Z]//g'"

# emacs
alias e='emacs -nw'

#tig
alias gst="tig status"

# lazygit
alias lg="lazygit"


export HISTSIZE=100000
export HISTFILESIZE=100000000000
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
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf --prompt="Parent Folders: " --height=~50% --layout=reverse --border --exit-0)
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

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

function chpwd () {
    [ ! -z "$NVIM" ] && nv -x "lcd $PWD"
}

# bun
export PATH="$HOME/.bun/bin:$PATH"

# antlr4
export CLASSPATH=".:/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.12.0-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

#lesspipe

# sets LESSOPEN and LESSCLOSE variables
# eval "$(SHELL=/bin/sh lesspipe.sh)"

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

# lunarvim
export LUNARVIM_RUNTIME_DIR="/Users/zdeng/.local/share/lunarvim"

eval "$(lua /Users/zdeng/bin/z.lua/z.lua --init zsh enhanced once echo fzf)"

export PATH="$PATH:$HOME/.luarocks/bin"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# bun completions
[ -s "/Users/zdeng/.bun/_bun" ] && source "/Users/zdeng/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# cheatsheet
alias cs='cheat $(cheat -l | awk ''{print $1}'' | fzf --preview ''cheat {} -c'')'

source ~/.afm-git-configrc

# ImageMagick
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
