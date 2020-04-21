set nocompatible

filetype off                  " required
set encoding=utf-8            " required by YCM

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

"Plugin 'https://github.com/vim-scripts/SyntaxRange.git'
Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
Plugin 'https://github.com/tpope/vim-repeat.git'
"Plugin 'https://github.com/tpope/vim-fugitive.git'
"Plugin 'https://github.com/elixir-editors/vim-elixir'
"Plugin 'https://github.com/scrooloose/nerdtree.git'
"Plugin 'https://github.com/Yggdroot/LeaderF.git'
"Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'simnalamburt/vim-mundo'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'https://github.com/wellle/targets.vim.git'
Plugin 'gaving/vim-textobj-argument'

Plugin 'xavierchow/vim-swagger-preview'


"Plugin 'https://github.com/AndrewRadev/sideways.vim.git'
"Plugin 'https://github.com/airblade/vim-rooter.git'

"Plugin 'https://github.com/mhinz/vim-grepper.git'
"Plugin 'https://github.com/osyo-manga/vim-over.git'
"Plugin 'https://github.com/dag/vim-fish'
"Plugin 'https://github.com/gcmt/taboo.vim.git'
"Plugin 'https://github.com/Chun-Yang/vim-action-ag.git'
"Plugin 'https://github.com/Shougo/vimshell.vim.git'
"Plugin 'https://github.com/guns/vim-clojure-static'
"Plugin 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
"Plugin 'https://github.com/guns/vim-sexp.git'
"Plugin 'https://github.com/guns/vim-clojure-highlight'
"Plugin 'https://github.com/neovimhaskell/haskell-vim.git'
"Plugin 'kshenoy/vim-signature'
" Plugin 'junegunn/fzf.vim'

"Colorschemes
Plugin 'https://github.com/mkarmona/colorsbox.git'
Plugin 'rafi/awesome-vim-colorschemes'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"########## Developer Settings ##########"
colo atom
set guifont=Iosevka:h20
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set backspace=2
set cindent shiftwidth=4
set smartindent
set ignorecase
set smartcase
set ai
set nu
set showmatch
set mouse=a
set ruler
set incsearch
set hlsearch
set nowrapscan
set display+=lastline
set cursorline
set hidden
set list
set listchars=tab:\|\ ,
set so=5
set noerrorbells
set vb t_vb=
set novb
set guioptions-=e

syntax enable
syntax on
filetype plugin on
filetype plugin indent on

set laststatus=2
set cmdheight=2
set spell
set thesaurus+=~/.config/dictionary/moby_thesaurus.txt

"########## Insert Mode Shortcuts ##########"
inoremap ,. <ESC>
inoremap ,,. ,<ESC>
vnoremap ,. <ESC>
xnoremap ,. <ESC>
cnoremap ,. <ESC>

nnoremap ,k "
vnoremap ,k "

inoremap ,l <C-O>
inoremap ,h <C-H>

vnoremap ,x <ESC>`.``gvp``P

nnoremap ,c :tabnew $MYVIMRC<CR>

nnoremap ,u :MundoShow<CR>

nnoremap ,U gUiwe
inoremap ,U <ESC>gUiwgi

nnoremap ,y "+
vnoremap ,y "+

nnoremap ,, ,
vnoremap ,, ,

nnoremap ,d :vsp ~/vim_demo.md<C-W>L45<C-W><Bar>/Case 

"########## Insert mode j Combinations ##########" {{{
inoremap jk <ESC>
inoremap jl <Right>
inoremap jh <Left>
" }}}

"########## Insert Mode Shortcuts ##########"
inoremap <M-h> <ESC>i
inoremap <M-l> <ESC>la
"Swap
vnoremap <C-S-X> <ESC>`.``gvp``P

"######### Remap CTRL_W to W ######## {{{
noremap <TAB>m <c-w>\|<c-w>_

noremap <TAB>+ <C-W>+
noremap <TAB>- <C-W>-
noremap <TAB>< <C-W><
noremap <TAB>= <C-W>=
noremap <TAB>> <C-W>>
noremap <TAB>H <C-W>H
noremap <TAB>J <C-W>J
noremap <TAB>K <C-W>K
noremap <TAB>L <C-W>L
noremap <TAB>P <C-W>P
noremap <TAB>R <C-W>R
noremap <TAB>S <C-W>S
noremap <TAB>T <C-W>T
noremap <TAB>W <C-W>W
noremap <TAB>] <C-W>]
noremap <TAB>^ <C-W>^
noremap <TAB>_ <C-W>_
noremap <TAB>b <C-W>b
noremap <TAB>c <C-W>c
noremap <TAB>d <C-W>d
noremap <TAB>f <C-W>f
noremap <TAB>F <C-W>F
noremap <TAB>g<C-]> <C-W>g<C-]>
noremap <TAB>g<Bar> <C-W>g<Bar>
noremap <TAB>g} <C-W>g}
noremap <TAB>gf <C-W>gf
noremap <TAB>gF <C-W>gF
noremap <TAB>h <C-W>h
noremap <TAB>i <C-W>i
noremap <TAB>j <C-W>j
noremap <TAB>k <C-W>k
noremap <TAB>l <C-W>l
noremap <TAB>n <C-W>n
noremap <TAB>o <C-W>o
noremap <TAB>p <C-W>p
noremap <TAB>q <C-W>q
noremap <TAB>r <C-W>r
noremap <TAB>s <C-W>s
noremap <TAB>t <C-W>t
noremap <TAB>v <C-W>v
noremap <TAB>w <C-W>w
noremap <TAB><TAB> <C-W>w
noremap <TAB>x <C-W>x
noremap <TAB>z <C-W>z
noremap <TAB><Bar> <C-W><Bar>
noremap <TAB>} <C-W>}
noremap <TAB><Down> <C-W><Down>
noremap <TAB><Up> <C-W><Up>
noremap <TAB><Left> <C-W><Left>
noremap <TAB><Right> <C-W><Right>
" }}}


"Fold by keyword
nnoremap <Leader>z/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"Fold except selection
vnoremap <Leader>zv <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<


nmap <C-S-U> gUiwe
imap <C-S-U> <ESC>gUiwgi

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap g0 _


let mapleader=" "

function! CopyToBottom()
    let l:a = input("Copy to bottom with Regex: ")
    execute "g/".l:a."/t$"
endfunction

noremap <Leader>zg :call CopyToBottom()<CR>

command! DeleteBlankLine g/^\s*$/d
 
function! FunChangeFontSize()
    let l:s = input("FontSize: ")
    execute "set guifont=Iosevka:h".l:s
endfunction

command! ChangeFontSize call FunChangeFontSize()

" ######## Enhanced Diff ######## {{{
" autocmd VimEnter * EnhancedDiff histogram
" }}}

"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)
"map  <Leader>/ <Plug>(easymotion-sn)
"omap <Leader>/ <Plug>(easymotion-tn)
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"map <Leader>h <Plug>(easymotion-linebackward)
"map <Leader>s <Plug>(easymotion-s)
"map <Leader>S <Plug>(easymotion-s2)
"nmap <Leader>t <Plug>(easymotion-t)
"map  <Leader>f <Plug>(easymotion-bd-f)
" s{char}{char} to move to {char}{char}
" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>v V<Plug>(easymotion-bd-jk)

nmap <Space>ff <Plug>(easymotion-f)
vmap <Space>ff <Plug>(easymotion-f)
nmap <Space>fF <Plug>(easymotion-F)
vmap <Space>fF <Plug>(easymotion-F)
nmap <Space>ft <Plug>(easymotion-t)
vmap <Space>ft <Plug>(easymotion-t)
nmap <Space>fT <Plug>(easymotion-T)
vmap <Space>fT <Plug>(easymotion-T)
nmap <Space>fw <Plug>(easymotion-w)
vmap <Space>fw <Plug>(easymotion-w)
nmap <Space>fW <Plug>(easymotion-W)
vmap <Space>fW <Plug>(easymotion-W)
nmap <Space>fe <Plug>(easymotion-e)
vmap <Space>fe <Plug>(easymotion-e)
nmap <Space>fE <Plug>(easymotion-E)
vmap <Space>fE <Plug>(easymotion-E)
nmap <Space>fj <Plug>(easymotion-j)
vmap <Space>fj <Plug>(easymotion-j)
nmap <Space>fk <Plug>(easymotion-k)
vmap <Space>fk <Plug>(easymotion-k)
nmap <Space>fn <Plug>(easymotion-n)
vmap <Space>fn <Plug>(easymotion-n)
nmap <Space>fN <Plug>(easymotion-N)
vmap <Space>fN <Plug>(easymotion-N)
nmap <Space>f/ <Plug>(easymotion-sn)
vmap <Space>f/ <Plug>(easymotion-sn)
nmap <Space><Space>f <Plug>(easymotion-s)
vmap <Space><Space>f <Plug>(easymotion-s)


" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

nmap <Leader>mc :MultipleCursorsFind<Space>
vmap <Leader>mc :MultipleCursorsFind<Space>
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

vmap <CR> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" LeaderF {{{
nnoremap <Leader>pp :LeaderfFile<CR>
nnoremap <Leader>p* <Plug>(LeaderfRgCwordLiteralBoundary)
vnoremap <Leader>p* <Plug>(LeaderfRgVisualLiteralNoBoundary)
nnoremap <Leader>L :Leaderf line<CR>
"}}}

" OverCommandLine
map <Leader><Leader>/ :OverCommandLine<CR>

command! CleanUpWhiteSpace :g/^$/d<CR>gv:s/^\s*//<CR>

set nowritebackup
set nobackup
set backupdir-=.
set backupdir^=~\\tmp
set noswapfile
set wildmenu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" select the pasted block
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" autocomplete buffer names
set wildchar=<Tab> wildmenu wildmode=full

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

"set clipboard=unnamed

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1



" hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorLine term=bold cterm=bold ctermbg=237 guibg=Grey30
" hi Search term=underline cterm=underline ctermbg=240 ctermfg=red guibg=Grey30

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"   " This is the default extra key bindings
"   let g:fzf_action = {
"     \ 'ctrl-t': 'tab split',
"     \ 'ctrl-x': 'split',
"     \ 'ctrl-v': 'vsplit' }
"   
"   " Default fzf layout
"   " - down / up / left / right
"   let g:fzf_layout = { 'down': '~40%' }
"   
"   " In Neovim, you can set up fzf window using a Vim command
"   let g:fzf_layout = { 'window': 'enew' }
"   let g:fzf_layout = { 'window': '-tabnew' }
"   
"   " Customize fzf colors to match your color scheme
"   let g:fzf_colors =
"   \ { 'fg':      ['fg', 'Normal'],
"     \ 'bg':      ['bg', 'Normal'],
"     \ 'hl':      ['fg', 'Comment'],
"     \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"     \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"     \ 'hl+':     ['fg', 'Statement'],
"     \ 'info':    ['fg', 'PreProc'],
"     \ 'prompt':  ['fg', 'Conditional'],
"     \ 'pointer': ['fg', 'Exception'],
"     \ 'marker':  ['fg', 'Keyword'],
"     \ 'spinner': ['fg', 'Label'],
"     \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Files] Extra options for fzf
"   e.g. File preview using Highlight
"        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
"  let g:fzf_files_options =
"  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
"  let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
"  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
"  let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
"  let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"    " Mapping selecting mappings
"    nmap <leader><tab> <Plug>(fzf-maps-n)
"    xmap <leader><tab> <Plug>(fzf-maps-x)
"    omap <leader><tab> <Plug>(fzf-maps-o)
"    
"    " Insert mode completion
"    imap <c-x><c-k> <Plug>(fzf-complete-word)
"    imap <c-x><c-f> <Plug>(fzf-complete-path)
"    imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
"    imap <c-x><c-l> <Plug>(fzf-complete-line)
"    
"    " Advanced customization using autoload functions
"    inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"    
"    " Replace the default dictionary completion with fzf-based fuzzy completion
"    inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
"    
"    set rtp+=/usr/local/opt/fzf
set rtp+=/usr/local/opt/fzf

nmap <Leader>y :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl


"Mundo {{{
set undofile
set undodir=~/.vim/undo
"}}}

"Sideway {{{
"omap aa <Plug>SidewaysArgumentTextobjA
"xmap aa <Plug>SidewaysArgumentTextobjA
"omap ia <Plug>SidewaysArgumentTextobjI
"xmap ia <Plug>SidewaysArgumentTextobjI
"}}}

"UltiSnip {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

"Swagger preview {{{
nmap <leader><leader>e <Plug>GenerateDiagram 
"}}}

"Others {{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
"}}}

"TA Commands {{{
""" Reorganise google feed rejection log
command! TARwGRejectLog norm! :1g/^"@/d:%s/^.*"\ze{""productCode//e:%s/"}\zs",java,.*$//e:%sort u:%norm! d6f"f"xxld5f"f"D:sort /^\i\+,/:sort r /\i\+/:norm! ggO"productCode","reason"
command! TARwGRejectLogMerge let @a=':%s/^\([^,]\+\),\i\+\zs\n\1,\(\i\+\)/ \2/@a' | norm! @a


""" Extract Immutable property copy code. Put source variable in register y. Run in Builder class
command! TACopyImmutable norm! Go:g/public final \i\+ with\L/t$vip:norm! d3Er.f(ldi(lDvip:norm! f(asource.get()vip:norm! 5lyt(f(;Pvip:sort uvip"+y

""" Auto commit message when executing `git commit`
command! TACommitMessage norm! :5t.df/oggddf-;lgUl:s/-/ /gElr-0:nohlI[Ea]ll

""" Auto insert TODO comment with branch ticket number
command! TATodo exec "norm! a TODO :r !git name-rev --name-only HEADkJdf/2f-Da " | startinsert!

""" Wrap the selected comment with `=`, use in visual mode with <CTRL-U>
command! TACommentBox norm! `<`>``yyP_Wv$r=$5a=yy``p

""" Covert comma separated keywords to strings in multiple lines
function FnTAMapstructQuickFix()
  norm :g/Unmapped source propert\%(ies\|y\):/norm d/Unmapped source propert\%(ies\|y\):/e+2f"DO@BeanMapping(ignoreUnmappedSourceProperties = {0i 0dwj:s/\i\+/"\0"/g:s/,\s*/,\r/go})j:s/^\s*\%(public abstract \)\?/public abstract jcckkkvi{>
  norm :g/Unmapped target propert\%(ies\|y\).*Mapping from/norm! d/Unmapped target propert\%(ies\|y\):/e+2f"s0kkOj:s/\(\i\+\)\%(,\s*\)\?/@Mapping(target = "\1", ignore = true)\r/g2dddf""0dEd2f"ipublic abstract ElC map(0 value);jddcc:nohl
  norm :g/Unmapped target propert\%(ies\|y\): "[^"]\+"\.$/norm! d/Unmapped target propert\%(ies\|y\):/e+2f"s0kkOj:s/\(\i\+\)\%(,\s*\)\?/@Mapping(target = "\1", ignore = true)\r/g3dd0dw:s/^\s*\%(public abstract \)\?/public abstract jcc:nohl
  norm :g/Consider to declare\/implement a mapping method:/norm! d/Consider to declare\/implement a mapping method:/e+1lyi"VpIpublic abstract A;O // Add following mapping method:0dwjj2ddO
endfunction 
command! TAMapstructFix call FnTAMapstructQuickFix()

""" Format Solr entity
command! TAFmtJson norm! :%!jq -S:setl ft=json fdm=syntax:syn onggzMzo

""" Format Solr entity
command! TAFmtSolrEntity norm! :syn off:setl fdm=manualzE:v/^\s*"entity[^"]*":/d0dt{$T}D:s/\%(\\\)\@<!\\"/"/ge:s/\\\\\\"/\\"/ge:TAFmtJson

"}}}

nohl

"colors {{{
"hi x016_Grey0 ctermfg=16 guifg=#000000 "rgb=0,0,0
"hi x017_NavyBlue ctermfg=17 guifg=#00005f "rgb=0,0,95
"hi x018_DarkBlue ctermfg=18 guifg=#000087 "rgb=0,0,135
"hi x019_Blue3 ctermfg=19 guifg=#0000af "rgb=0,0,175
"hi x020_Blue3 ctermfg=20 guifg=#0000d7 "rgb=0,0,215
"hi x021_Blue1 ctermfg=21 guifg=#0000ff "rgb=0,0,255
"hi x022_DarkGreen ctermfg=22 guifg=#005f00 "rgb=0,95,0
"hi x023_DeepSkyBlue4 ctermfg=23 guifg=#005f5f "rgb=0,95,95
"hi x024_DeepSkyBlue4 ctermfg=24 guifg=#005f87 "rgb=0,95,135
"hi x025_DeepSkyBlue4 ctermfg=25 guifg=#005faf "rgb=0,95,175
"hi x026_DodgerBlue3 ctermfg=26 guifg=#005fd7 "rgb=0,95,215
"hi x027_DodgerBlue2 ctermfg=27 guifg=#005fff "rgb=0,95,255
"hi x028_Green4 ctermfg=28 guifg=#008700 "rgb=0,135,0
"hi x029_SpringGreen4 ctermfg=29 guifg=#00875f "rgb=0,135,95
"hi x030_Turquoise4 ctermfg=30 guifg=#008787 "rgb=0,135,135
"hi x031_DeepSkyBlue3 ctermfg=31 guifg=#0087af "rgb=0,135,175
"hi x032_DeepSkyBlue3 ctermfg=32 guifg=#0087d7 "rgb=0,135,215
"hi x033_DodgerBlue1 ctermfg=33 guifg=#0087ff "rgb=0,135,255
"hi x034_Green3 ctermfg=34 guifg=#00af00 "rgb=0,175,0
"hi x035_SpringGreen3 ctermfg=35 guifg=#00af5f "rgb=0,175,95
"hi x036_DarkCyan ctermfg=36 guifg=#00af87 "rgb=0,175,135
"hi x037_LightSeaGreen ctermfg=37 guifg=#00afaf "rgb=0,175,175
"hi x038_DeepSkyBlue2 ctermfg=38 guifg=#00afd7 "rgb=0,175,215
"hi x039_DeepSkyBlue1 ctermfg=39 guifg=#00afff "rgb=0,175,255
"hi x040_Green3 ctermfg=40 guifg=#00d700 "rgb=0,215,0
"hi x041_SpringGreen3 ctermfg=41 guifg=#00d75f "rgb=0,215,95
"hi x042_SpringGreen2 ctermfg=42 guifg=#00d787 "rgb=0,215,135
"hi x043_Cyan3 ctermfg=43 guifg=#00d7af "rgb=0,215,175
"hi x044_DarkTurquoise ctermfg=44 guifg=#00d7d7 "rgb=0,215,215
"hi x045_Turquoise2 ctermfg=45 guifg=#00d7ff "rgb=0,215,255
"hi x046_Green1 ctermfg=46 guifg=#00ff00 "rgb=0,255,0
"hi x047_SpringGreen2 ctermfg=47 guifg=#00ff5f "rgb=0,255,95
"hi x048_SpringGreen1 ctermfg=48 guifg=#00ff87 "rgb=0,255,135
"hi x049_MediumSpringGreen ctermfg=49 guifg=#00ffaf "rgb=0,255,175
"hi x050_Cyan2 ctermfg=50 guifg=#00ffd7 "rgb=0,255,215
"hi x051_Cyan1 ctermfg=51 guifg=#00ffff "rgb=0,255,255
"hi x052_DarkRed ctermfg=52 guifg=#5f0000 "rgb=95,0,0
"hi x053_DeepPink4 ctermfg=53 guifg=#5f005f "rgb=95,0,95
"hi x054_Purple4 ctermfg=54 guifg=#5f0087 "rgb=95,0,135
"hi x055_Purple4 ctermfg=55 guifg=#5f00af "rgb=95,0,175
"hi x056_Purple3 ctermfg=56 guifg=#5f00d7 "rgb=95,0,215
"hi x057_BlueViolet ctermfg=57 guifg=#5f00ff "rgb=95,0,255
"hi x058_Orange4 ctermfg=58 guifg=#5f5f00 "rgb=95,95,0
"hi x059_Grey37 ctermfg=59 guifg=#5f5f5f "rgb=95,95,95
"hi x060_MediumPurple4 ctermfg=60 guifg=#5f5f87 "rgb=95,95,135
"hi x061_SlateBlue3 ctermfg=61 guifg=#5f5faf "rgb=95,95,175
"hi x062_SlateBlue3 ctermfg=62 guifg=#5f5fd7 "rgb=95,95,215
"hi x063_RoyalBlue1 ctermfg=63 guifg=#5f5fff "rgb=95,95,255
"hi x064_Chartreuse4 ctermfg=64 guifg=#5f8700 "rgb=95,135,0
"hi x065_DarkSeaGreen4 ctermfg=65 guifg=#5f875f "rgb=95,135,95
"hi x066_PaleTurquoise4 ctermfg=66 guifg=#5f8787 "rgb=95,135,135
"hi x067_SteelBlue ctermfg=67 guifg=#5f87af "rgb=95,135,175
"hi x068_SteelBlue3 ctermfg=68 guifg=#5f87d7 "rgb=95,135,215
"hi x069_CornflowerBlue ctermfg=69 guifg=#5f87ff "rgb=95,135,255
"hi x070_Chartreuse3 ctermfg=70 guifg=#5faf00 "rgb=95,175,0
"hi x071_DarkSeaGreen4 ctermfg=71 guifg=#5faf5f "rgb=95,175,95
"hi x072_CadetBlue ctermfg=72 guifg=#5faf87 "rgb=95,175,135
"hi x073_CadetBlue ctermfg=73 guifg=#5fafaf "rgb=95,175,175
"hi x074_SkyBlue3 ctermfg=74 guifg=#5fafd7 "rgb=95,175,215
"hi x075_SteelBlue1 ctermfg=75 guifg=#5fafff "rgb=95,175,255
"hi x076_Chartreuse3 ctermfg=76 guifg=#5fd700 "rgb=95,215,0
"hi x077_PaleGreen3 ctermfg=77 guifg=#5fd75f "rgb=95,215,95
"hi x078_SeaGreen3 ctermfg=78 guifg=#5fd787 "rgb=95,215,135
"hi x079_Aquamarine3 ctermfg=79 guifg=#5fd7af "rgb=95,215,175
"hi x080_MediumTurquoise ctermfg=80 guifg=#5fd7d7 "rgb=95,215,215
"hi x081_SteelBlue1 ctermfg=81 guifg=#5fd7ff "rgb=95,215,255
"hi x082_Chartreuse2 ctermfg=82 guifg=#5fff00 "rgb=95,255,0
"hi x083_SeaGreen2 ctermfg=83 guifg=#5fff5f "rgb=95,255,95
"hi x084_SeaGreen1 ctermfg=84 guifg=#5fff87 "rgb=95,255,135
"hi x085_SeaGreen1 ctermfg=85 guifg=#5fffaf "rgb=95,255,175
"hi x086_Aquamarine1 ctermfg=86 guifg=#5fffd7 "rgb=95,255,215
"hi x087_DarkSlateGray2 ctermfg=87 guifg=#5fffff "rgb=95,255,255
"hi x088_DarkRed ctermfg=88 guifg=#870000 "rgb=135,0,0
"hi x089_DeepPink4 ctermfg=89 guifg=#87005f "rgb=135,0,95
"hi x090_DarkMagenta ctermfg=90 guifg=#870087 "rgb=135,0,135
"hi x091_DarkMagenta ctermfg=91 guifg=#8700af "rgb=135,0,175
"hi x092_DarkViolet ctermfg=92 guifg=#8700d7 "rgb=135,0,215
"hi x093_Purple ctermfg=93 guifg=#8700ff "rgb=135,0,255
"hi x094_Orange4 ctermfg=94 guifg=#875f00 "rgb=135,95,0
"hi x095_LightPink4 ctermfg=95 guifg=#875f5f "rgb=135,95,95
"hi x096_Plum4 ctermfg=96 guifg=#875f87 "rgb=135,95,135
"hi x097_MediumPurple3 ctermfg=97 guifg=#875faf "rgb=135,95,175
"hi x098_MediumPurple3 ctermfg=98 guifg=#875fd7 "rgb=135,95,215
"hi x099_SlateBlue1 ctermfg=99 guifg=#875fff "rgb=135,95,255
"hi x100_Yellow4 ctermfg=100 guifg=#878700 "rgb=135,135,0
"hi x101_Wheat4 ctermfg=101 guifg=#87875f "rgb=135,135,95
"hi x102_Grey53 ctermfg=102 guifg=#878787 "rgb=135,135,135
"hi x103_LightSlateGrey ctermfg=103 guifg=#8787af "rgb=135,135,175
"hi x104_MediumPurple ctermfg=104 guifg=#8787d7 "rgb=135,135,215
"hi x105_LightSlateBlue ctermfg=105 guifg=#8787ff "rgb=135,135,255
"hi x106_Yellow4 ctermfg=106 guifg=#87af00 "rgb=135,175,0
"hi x107_DarkOliveGreen3 ctermfg=107 guifg=#87af5f "rgb=135,175,95
"hi x108_DarkSeaGreen ctermfg=108 guifg=#87af87 "rgb=135,175,135
"hi x109_LightSkyBlue3 ctermfg=109 guifg=#87afaf "rgb=135,175,175
"hi x110_LightSkyBlue3 ctermfg=110 guifg=#87afd7 "rgb=135,175,215
"hi x111_SkyBlue2 ctermfg=111 guifg=#87afff "rgb=135,175,255
"hi x112_Chartreuse2 ctermfg=112 guifg=#87d700 "rgb=135,215,0
"hi x113_DarkOliveGreen3 ctermfg=113 guifg=#87d75f "rgb=135,215,95
"hi x114_PaleGreen3 ctermfg=114 guifg=#87d787 "rgb=135,215,135
"hi x115_DarkSeaGreen3 ctermfg=115 guifg=#87d7af "rgb=135,215,175
"hi x116_DarkSlateGray3 ctermfg=116 guifg=#87d7d7 "rgb=135,215,215
"hi x117_SkyBlue1 ctermfg=117 guifg=#87d7ff "rgb=135,215,255
"hi x118_Chartreuse1 ctermfg=118 guifg=#87ff00 "rgb=135,255,0
"hi x119_LightGreen ctermfg=119 guifg=#87ff5f "rgb=135,255,95
"hi x120_LightGreen ctermfg=120 guifg=#87ff87 "rgb=135,255,135
"hi x121_PaleGreen1 ctermfg=121 guifg=#87ffaf "rgb=135,255,175
"hi x122_Aquamarine1 ctermfg=122 guifg=#87ffd7 "rgb=135,255,215
"hi x123_DarkSlateGray1 ctermfg=123 guifg=#87ffff "rgb=135,255,255
"hi x124_Red3 ctermfg=124 guifg=#af0000 "rgb=175,0,0
"hi x125_DeepPink4 ctermfg=125 guifg=#af005f "rgb=175,0,95
"hi x126_MediumVioletRed ctermfg=126 guifg=#af0087 "rgb=175,0,135
"hi x127_Magenta3 ctermfg=127 guifg=#af00af "rgb=175,0,175
"hi x128_DarkViolet ctermfg=128 guifg=#af00d7 "rgb=175,0,215
"hi x129_Purple ctermfg=129 guifg=#af00ff "rgb=175,0,255
"hi x130_DarkOrange3 ctermfg=130 guifg=#af5f00 "rgb=175,95,0
"hi x131_IndianRed ctermfg=131 guifg=#af5f5f "rgb=175,95,95
"hi x132_HotPink3 ctermfg=132 guifg=#af5f87 "rgb=175,95,135
"hi x133_MediumOrchid3 ctermfg=133 guifg=#af5faf "rgb=175,95,175
"hi x134_MediumOrchid ctermfg=134 guifg=#af5fd7 "rgb=175,95,215
"hi x135_MediumPurple2 ctermfg=135 guifg=#af5fff "rgb=175,95,255
"hi x136_DarkGoldenrod ctermfg=136 guifg=#af8700 "rgb=175,135,0
"hi x137_LightSalmon3 ctermfg=137 guifg=#af875f "rgb=175,135,95
"hi x138_RosyBrown ctermfg=138 guifg=#af8787 "rgb=175,135,135
"hi x139_Grey63 ctermfg=139 guifg=#af87af "rgb=175,135,175
"hi x140_MediumPurple2 ctermfg=140 guifg=#af87d7 "rgb=175,135,215
"hi x141_MediumPurple1 ctermfg=141 guifg=#af87ff "rgb=175,135,255
"hi x142_Gold3 ctermfg=142 guifg=#afaf00 "rgb=175,175,0
"hi x143_DarkKhaki ctermfg=143 guifg=#afaf5f "rgb=175,175,95
"hi x144_NavajoWhite3 ctermfg=144 guifg=#afaf87 "rgb=175,175,135
"hi x145_Grey69 ctermfg=145 guifg=#afafaf "rgb=175,175,175
"hi x146_LightSteelBlue3 ctermfg=146 guifg=#afafd7 "rgb=175,175,215
"hi x147_LightSteelBlue ctermfg=147 guifg=#afafff "rgb=175,175,255
"hi x148_Yellow3 ctermfg=148 guifg=#afd700 "rgb=175,215,0
"hi x149_DarkOliveGreen3 ctermfg=149 guifg=#afd75f "rgb=175,215,95
"hi x150_DarkSeaGreen3 ctermfg=150 guifg=#afd787 "rgb=175,215,135
"hi x151_DarkSeaGreen2 ctermfg=151 guifg=#afd7af "rgb=175,215,175
"hi x152_LightCyan3 ctermfg=152 guifg=#afd7d7 "rgb=175,215,215
"hi x153_LightSkyBlue1 ctermfg=153 guifg=#afd7ff "rgb=175,215,255
"hi x154_GreenYellow ctermfg=154 guifg=#afff00 "rgb=175,255,0
"hi x155_DarkOliveGreen2 ctermfg=155 guifg=#afff5f "rgb=175,255,95
"hi x156_PaleGreen1 ctermfg=156 guifg=#afff87 "rgb=175,255,135
"hi x157_DarkSeaGreen2 ctermfg=157 guifg=#afffaf "rgb=175,255,175
"hi x158_DarkSeaGreen1 ctermfg=158 guifg=#afffd7 "rgb=175,255,215
"hi x159_PaleTurquoise1 ctermfg=159 guifg=#afffff "rgb=175,255,255
"hi x160_Red3 ctermfg=160 guifg=#d70000 "rgb=215,0,0
"hi x161_DeepPink3 ctermfg=161 guifg=#d7005f "rgb=215,0,95
"hi x162_DeepPink3 ctermfg=162 guifg=#d70087 "rgb=215,0,135
"hi x163_Magenta3 ctermfg=163 guifg=#d700af "rgb=215,0,175
"hi x164_Magenta3 ctermfg=164 guifg=#d700d7 "rgb=215,0,215
"hi x165_Magenta2 ctermfg=165 guifg=#d700ff "rgb=215,0,255
"hi x166_DarkOrange3 ctermfg=166 guifg=#d75f00 "rgb=215,95,0
"hi x167_IndianRed ctermfg=167 guifg=#d75f5f "rgb=215,95,95
"hi x168_HotPink3 ctermfg=168 guifg=#d75f87 "rgb=215,95,135
"hi x169_HotPink2 ctermfg=169 guifg=#d75faf "rgb=215,95,175
"hi x170_Orchid ctermfg=170 guifg=#d75fd7 "rgb=215,95,215
"hi x171_MediumOrchid1 ctermfg=171 guifg=#d75fff "rgb=215,95,255
"hi x172_Orange3 ctermfg=172 guifg=#d78700 "rgb=215,135,0
"hi x173_LightSalmon3 ctermfg=173 guifg=#d7875f "rgb=215,135,95
"hi x174_LightPink3 ctermfg=174 guifg=#d78787 "rgb=215,135,135
"hi x175_Pink3 ctermfg=175 guifg=#d787af "rgb=215,135,175
"hi x176_Plum3 ctermfg=176 guifg=#d787d7 "rgb=215,135,215
"hi x177_Violet ctermfg=177 guifg=#d787ff "rgb=215,135,255
"hi x178_Gold3 ctermfg=178 guifg=#d7af00 "rgb=215,175,0
"hi x179_LightGoldenrod3 ctermfg=179 guifg=#d7af5f "rgb=215,175,95
"hi x180_Tan ctermfg=180 guifg=#d7af87 "rgb=215,175,135
"hi x181_MistyRose3 ctermfg=181 guifg=#d7afaf "rgb=215,175,175
"hi x182_Thistle3 ctermfg=182 guifg=#d7afd7 "rgb=215,175,215
"hi x183_Plum2 ctermfg=183 guifg=#d7afff "rgb=215,175,255
"hi x184_Yellow3 ctermfg=184 guifg=#d7d700 "rgb=215,215,0
"hi x185_Khaki3 ctermfg=185 guifg=#d7d75f "rgb=215,215,95
"hi x186_LightGoldenrod2 ctermfg=186 guifg=#d7d787 "rgb=215,215,135
"hi x187_LightYellow3 ctermfg=187 guifg=#d7d7af "rgb=215,215,175
"hi x188_Grey84 ctermfg=188 guifg=#d7d7d7 "rgb=215,215,215
"hi x189_LightSteelBlue1 ctermfg=189 guifg=#d7d7ff "rgb=215,215,255
"hi x190_Yellow2 ctermfg=190 guifg=#d7ff00 "rgb=215,255,0
"hi x191_DarkOliveGreen1 ctermfg=191 guifg=#d7ff5f "rgb=215,255,95
"hi x192_DarkOliveGreen1 ctermfg=192 guifg=#d7ff87 "rgb=215,255,135
"hi x193_DarkSeaGreen1 ctermfg=193 guifg=#d7ffaf "rgb=215,255,175
"hi x194_Honeydew2 ctermfg=194 guifg=#d7ffd7 "rgb=215,255,215
"hi x195_LightCyan1 ctermfg=195 guifg=#d7ffff "rgb=215,255,255
"hi x196_Red1 ctermfg=196 guifg=#ff0000 "rgb=255,0,0
"hi x197_DeepPink2 ctermfg=197 guifg=#ff005f "rgb=255,0,95
"hi x198_DeepPink1 ctermfg=198 guifg=#ff0087 "rgb=255,0,135
"hi x199_DeepPink1 ctermfg=199 guifg=#ff00af "rgb=255,0,175
"hi x200_Magenta2 ctermfg=200 guifg=#ff00d7 "rgb=255,0,215
"hi x201_Magenta1 ctermfg=201 guifg=#ff00ff "rgb=255,0,255
"hi x202_OrangeRed1 ctermfg=202 guifg=#ff5f00 "rgb=255,95,0
"hi x203_IndianRed1 ctermfg=203 guifg=#ff5f5f "rgb=255,95,95
"hi x204_IndianRed1 ctermfg=204 guifg=#ff5f87 "rgb=255,95,135
"hi x205_HotPink ctermfg=205 guifg=#ff5faf "rgb=255,95,175
"hi x206_HotPink ctermfg=206 guifg=#ff5fd7 "rgb=255,95,215
"hi x207_MediumOrchid1 ctermfg=207 guifg=#ff5fff "rgb=255,95,255
"hi x208_DarkOrange ctermfg=208 guifg=#ff8700 "rgb=255,135,0
"hi x209_Salmon1 ctermfg=209 guifg=#ff875f "rgb=255,135,95
"hi x210_LightCoral ctermfg=210 guifg=#ff8787 "rgb=255,135,135
"hi x211_PaleVioletRed1 ctermfg=211 guifg=#ff87af "rgb=255,135,175
"hi x212_Orchid2 ctermfg=212 guifg=#ff87d7 "rgb=255,135,215
"hi x213_Orchid1 ctermfg=213 guifg=#ff87ff "rgb=255,135,255
"hi x214_Orange1 ctermfg=214 guifg=#ffaf00 "rgb=255,175,0
"hi x215_SandyBrown ctermfg=215 guifg=#ffaf5f "rgb=255,175,95
"hi x216_LightSalmon1 ctermfg=216 guifg=#ffaf87 "rgb=255,175,135
"hi x217_LightPink1 ctermfg=217 guifg=#ffafaf "rgb=255,175,175
"hi x218_Pink1 ctermfg=218 guifg=#ffafd7 "rgb=255,175,215
"hi x219_Plum1 ctermfg=219 guifg=#ffafff "rgb=255,175,255
"hi x220_Gold1 ctermfg=220 guifg=#ffd700 "rgb=255,215,0
"hi x221_LightGoldenrod2 ctermfg=221 guifg=#ffd75f "rgb=255,215,95
"hi x222_LightGoldenrod2 ctermfg=222 guifg=#ffd787 "rgb=255,215,135
"hi x223_NavajoWhite1 ctermfg=223 guifg=#ffd7af "rgb=255,215,175
"hi x224_MistyRose1 ctermfg=224 guifg=#ffd7d7 "rgb=255,215,215
"hi x225_Thistle1 ctermfg=225 guifg=#ffd7ff "rgb=255,215,255
"hi x226_Yellow1 ctermfg=226 guifg=#ffff00 "rgb=255,255,0
"hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f "rgb=255,255,95
"hi x228_Khaki1 ctermfg=228 guifg=#ffff87 "rgb=255,255,135
"hi x229_Wheat1 ctermfg=229 guifg=#ffffaf "rgb=255,255,175
"hi x230_Cornsilk1 ctermfg=230 guifg=#ffffd7 "rgb=255,255,215
"hi x231_Grey100 ctermfg=231 guifg=#ffffff "rgb=255,255,255
"hi x232_Grey3 ctermfg=232 guifg=#080808 "rgb=8,8,8
"hi x233_Grey7 ctermfg=233 guifg=#121212 "rgb=18,18,18
"hi x234_Grey11 ctermfg=234 guifg=#1c1c1c "rgb=28,28,28
"hi x235_Grey15 ctermfg=235 guifg=#262626 "rgb=38,38,38
"hi x236_Grey19 ctermfg=236 guifg=#303030 "rgb=48,48,48
"hi x237_Grey23 ctermfg=237 guifg=#3a3a3a "rgb=58,58,58
"hi x238_Grey27 ctermfg=238 guifg=#444444 "rgb=68,68,68
"hi x239_Grey30 ctermfg=239 guifg=#4e4e4e "rgb=78,78,78
"hi x240_Grey35 ctermfg=240 guifg=#585858 "rgb=88,88,88
"hi x241_Grey39 ctermfg=241 guifg=#626262 "rgb=98,98,98
"hi x242_Grey42 ctermfg=242 guifg=#6c6c6c "rgb=108,108,108
"hi x243_Grey46 ctermfg=243 guifg=#767676 "rgb=118,118,118
"hi x244_Grey50 ctermfg=244 guifg=#808080 "rgb=128,128,128
"hi x245_Grey54 ctermfg=245 guifg=#8a8a8a "rgb=138,138,138
"hi x246_Grey58 ctermfg=246 guifg=#949494 "rgb=148,148,148
"hi x247_Grey62 ctermfg=247 guifg=#9e9e9e "rgb=158,158,158
"hi x248_Grey66 ctermfg=248 guifg=#a8a8a8 "rgb=168,168,168
"hi x249_Grey70 ctermfg=249 guifg=#b2b2b2 "rgb=178,178,178
"hi x250_Grey74 ctermfg=250 guifg=#bcbcbc "rgb=188,188,188
"hi x251_Grey78 ctermfg=251 guifg=#c6c6c6 "rgb=198,198,198
"hi x252_Grey82 ctermfg=252 guifg=#d0d0d0 "rgb=208,208,208
"hi x253_Grey85 ctermfg=253 guifg=#dadada "rgb=218,218,21
"hi x254_Grey89 ctermfg=254 guifg=#e4e4e4 "rgb=228,228,228
"hi x255_Grey93 ctermfg=255 guifg=#eeeeee "rgb=238,238,238
"}}}

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}

