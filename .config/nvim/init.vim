"Specify a directory for plugins

" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
set nocompatible
"########## Plugins ##########{{{
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'inkarkat/vim-ingo-library'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive' " Git integration
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/vim-terminal-help'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'skywind3000/LeaderF-snippet'
Plug 'rbgrouleff/bclose.vim'  " Needed by ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'wellle/targets.vim'
Plug 'gaving/vim-textobj-argument'
Plug 'nathangrigg/vim-beancount'
Plug 'yegappan/mru'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'axvr/org.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'blahgeek/neovim-colorcoder', { 'do' : ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'inkarkat/vim-mark'
Plug 'tpope/vim-commentary'
Plug 'duganchen/vim-soy'
Plug 'kcsongor/vim-tabbar'
Plug 'AndrewRadev/inline_edit.vim'
Plug 't9md/vim-choosewin'
Plug 'sirdavidoff/vim-nearest-complete'
Plug 'liuchengxu/graphviz.vim'

"========== Themes =========={{{
Plug 'rakr/vim-one'
Plug 'matveyt/vim-modest'
Plug 'mkarmona/materialbox'
Plug 'sainnhe/edge'
Plug 'vim-scripts/peaksea'
Plug 'muellan/am-colors'
Plug 'vim-scripts/moria'
Plug 'vim-scripts/earendel'
Plug 'dfrunza/vim'
Plug 'sonph/onehalf'
"Plug 'https://github.com/mkarmona/colorsbox.git'
"Plug 'rafi/awesome-vim-colorschemes'
"}}}

"Plug '907th/vim-auto-save'
"Plug 'skywind3000/vim-auto-popmenu'
"Plug 'skywind3000/vim-dict'
"Plug 'skywind3000/LeaderF-snippet'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'rhysd/vim-grammarous'  " Grammar check
"Plug 'Yilin-Yang/vim-markbar'
"Plug 'beeender/Comrade'  " Intellij integration
"Plug 'benmills/vimux'
"Plug 'chrisbra/vim-diff-enhanced'
"Plug 'gcmt/taboo.vim'
"Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
"Plug 'AndrewRadev/sideways.vim'
"Plug 'Chun-Yang/vim-action-ag'
"Plug 'Shougo/vimshell.vim'
"Plug 'airblade/vim-rooter'
"Plug 'chrisbra/csv.vim'
"Plug 'dag/vim-fish'
"Plug 'elixir-editors/vim-elixir'
"Plug 'gcmt/taboo.vim'
"Plug 'guns/vim-clojure-highlight'
"Plug 'guns/vim-clojure-static'
"Plug 'guns/vim-sexp'
"Plug 'jceb/vim-orgmode'
"Plug 'nathangrigg/vim-beancount'
"Plug 'neovimhaskell/haskell-vim'
"Plug 'tpope/vim-sexp-mappings-for-regular-people'
"Plug 'vim-scripts/SyntaxRange'
"Plug 'jtdowney/vimux-cargo'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/gv.vim' " Git log
"Plug 'kshenoy/vim-signature'
"Plug 'lifepillar/vim-cheat40'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh', 'branch': 'release'}
"Plug 'pangloss/vim-javascript'  "Just better syntax heighlighting
"Plug 'phongvcao/vim-stardict'
"Plug 'slashmili/alchemist.vim'
"Plug 'uarun/vim-protobuf'
"Plug 'vim-scripts/LargeFile'
"Plug 'whiteinge/diffconflicts'
"Plug 'xavierchow/vim-swagger-preview'
"Plug 'nvim-treesitter/playground'
"Plug 'ledger/vim-ledger'
"Plug 'yegappan/taglist'
"Plug 'skywind3000/vim-quickui'
"Plug 'preservim/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
"Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'junkblocker/patchreview-vim'
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Needed by unite.vim
"Plug 'MTDL9/vim-log-highlighting'
"Plug 'sillybun/vim-repl'

call plug#end()
" }}}
"########## Load Modules ##########{{{
" =======================
"
" Curent file path
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Define a LoadScript command
command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'
"}}}
"########## pangloss/vim-javascript ##########{{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

set conceallevel=0
let g:javascript_conceal_function                  = "⨎"
let g:javascript_conceal_this                      = "🙋"
let g:javascript_conceal_return                    = "👈"
let g:javascript_conceal_undefined                 = "💥"
map <space>dsj<space> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
" }}}
"########## Colorschemes ##########{{{
"colo colorsbox-steighties
"colo github
set background=dark
colorscheme moria
" }}}
"########## Developer Settings ########## {{{
set termguicolors
set encoding=utf-8
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
set splitright
set splitbelow
set nospell
set thesaurus+=~/.config/dictionary/moby_thesaurus.txt
set textwidth=0

syntax enable
syntax on
filetype plugin on
filetype plugin indent on

set laststatus=2
set cmdheight=2
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

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
" }}}
"########## Comma Combinations ##########" {{{
inoremap ,. <ESC>
inoremap ,,. ,<ESC>
vnoremap ,. <ESC>
xnoremap ,. <ESC>
lnoremap ,. <ESC>
nnoremap ,. <ESC>
cnoremap ,. <ESC>

nnoremap ,k "
vnoremap ,k "

inoremap ,l <C-O>
inoremap ,h <C-H>

vnoremap ,x <ESC>`.``gvp``P
nnoremap ,x viw<ESC>`.``gvp``P

nnoremap ,c :tabnew $MYVIMRC<CR>
nnoremap ,C :source $MYVIMRC<cr>:echo "vimrc reloaded..."<cr>

nnoremap ,u :MundoShow<CR>

nnoremap ,U gUiwe
inoremap ,U <ESC>gUiwgi

nnoremap ,y "+
vnoremap ,y "+
nnoremap ,p "0p
vnoremap ,p "0p

nnoremap ,, ,
vnoremap ,, ,

inoremap ,p <c-r>=expand('%:p')<cr>
cnoremap ,p <c-r>=expand('%:p')<cr>
" }}}
"########## Insert mode j Combinations ##########" {{{
inoremap jk <ESC>
inoremap jl <Right>
inoremap jh <Left>
" }}}
"########## NERDTree ##########{{{
nnoremap <Space>su<Space> :NERDTreeFocus<CR>
nnoremap <Space>sui<Space> :NERDTreeClose<CR>
nnoremap <Space>siu<Space> :NERDTreeClose<CR>
nnoremap <Space>so<Space> :NERDTreeToggle<CR>
nnoremap <Space>si<Space> :NERDTreeFind<CR>
"}}}
"########## nvim-tree.lua ##########{{{
"nnoremap <space>so<space> :NvimTreeToggle<CR>
"nnoremap <space>sr<space> :NvimTreeRefresh<CR>
"nnoremap <space>si<space> :NvimTreeFindFile<CR>
"let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', 'target', '.idea' ] "empty by default
"set termguicolors
"}}}
"########## Ranger ##########" {{{
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_command_override = 'ranger --cmd "set draw_borders=0" --cmd "set preview_directories=0" --cmd "set colorscheme=default"'

" }}}
"########## Vimux ########## " {{{

"nnoremap <Leader>rc :CargoRun<CR>
"nnoremap <Leader>ra :CargoTestAll<CR>
"nnoremap <Leader>rb :CargoUnitTestCurrentFile<CR>
"nnoremap <Leader>rf :CargoUnitTestFocused<CR>
"nnoremap <Leader>rs :VimuxPromptCommand<CR>

let g:VimuxOrientation="h"
let g:VimuxHeight="30"

"}}}
"########## Complete Menu Style ########### {{{
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgray
"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgray guibg=black
"}}}
"########## Insert Mode Shortcuts ########## {{{
inoremap <M-h> <ESC>i
inoremap <M-l> <ESC>la
"}}}
"########## Folds ##########{{{
"Fold by keyword
nnoremap <Leader>z/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
vnoremap <Leader>z* "sy:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
nnoremap <Leader>z* "syiw:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"Fold except selection
vnoremap <Leader>zv <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<
"}}}
"########## Adjust up/down ##########{{{
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k
" }}}
"########## Tab Enhancement ##########{{{
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <space>t<space> :exec "tabn " . g:lasttab<cr>
"}}}
" ########## Hybrid Key Mapping ##########{{{
inoremap <c-b> <esc>i
inoremap <c-f> <c-o>a
inoremap <D-f> <esc>ea
inoremap <D-b> <esc>bi
inoremap <D-f> <esc>ea
inoremap <c-e> <esc>A
inoremap <c-a> <esc>I
" }}}
"########## Remap CTRL_W to TAB ######### {{{
nnoremap <TAB>m <c-w>\|<c-w>_

nnoremap <TAB>+ <C-W>+
nnoremap <TAB>- <C-W>-
nnoremap <TAB>< <C-W><
nnoremap <TAB>= <C-W>=
nnoremap <TAB>> <C-W>>
nnoremap <TAB>H <C-W>H
nnoremap <TAB>J <C-W>J
nnoremap <TAB>K <C-W>K
nnoremap <TAB>L <C-W>L
nnoremap <TAB>P <C-W>P
nnoremap <TAB>R <C-W>R
nnoremap <TAB>S <C-W>S
nnoremap <TAB>T <C-W>T
nnoremap <TAB>W <C-W>W
nnoremap <TAB>] <C-W>]
nnoremap <TAB>^ <C-W>^
nnoremap <TAB>_ <C-W>_
nnoremap <TAB>b <C-W>b
nnoremap <TAB>c <C-W>c
nnoremap <TAB>d <C-W>d
nnoremap <TAB>f <C-W>f
nnoremap <TAB>F <C-W>F
nnoremap <TAB>g<C-]> <C-W>g<C-]>
nnoremap <TAB>g<Bar> <C-W>g<Bar>
nnoremap <TAB>g} <C-W>g}
nnoremap <TAB>gf <C-W>gf
nnoremap <TAB>gF <C-W>gF
nnoremap <TAB>h <C-W>h
nnoremap <TAB>j <C-W>j
nnoremap <TAB>k <C-W>k
nnoremap <TAB>l <C-W>l
nnoremap <TAB>n <C-W>n
nnoremap <TAB>o <C-W>o
nnoremap <TAB>p <C-W>p
nnoremap <TAB>q <C-W>q
nnoremap <TAB>r <C-W>r
nnoremap <TAB>s <C-W>s
nnoremap <TAB>t <C-W>t
nnoremap <TAB>v <C-W>v
nnoremap <TAB>w <C-W>w
nnoremap <TAB><TAB> <C-W>w
nnoremap <TAB>x <C-W>x
nnoremap <TAB>z <C-W>z
nnoremap <TAB><Bar> <C-W><Bar>
nnoremap <TAB>} <C-W>}
nnoremap <TAB><Down> <C-W><Down>
nnoremap <TAB><Up> <C-W><Up>
nnoremap <TAB><Left> <C-W><Left>
nnoremap <TAB><Right> <C-W><Right>

nnoremap <TAB>i <C-I>

nnoremap <TAB>, 10<C-W><
nnoremap <TAB>. 10<C-W>>
" }}}
"########## Diff Option ##########{{{
set diffopt+=context:20
let g:diff_algorithms = [
      \ "myers",
      \ "minimal",
      \ "patience",
      \ "histogram",
      \ ]
let g:diff_algorithm = "patience"

func! DiffSwitchAlgorithm()
  let l:total_diff_algos = len(g:diff_algorithms)
  let l:i = 0
  while l:i < l:total_diff_algos && g:diff_algorithms[l:i] !=# g:diff_algorithm
    let l:i += 1
  endwhile
  if l:i < l:total_diff_algos
    let g:diff_algorithm = g:diff_algorithms[(l:i + 1) % l:total_diff_algos]
  else
    let g:diff_algorithm = "patience"
  endif
  for l:algo in g:diff_algorithms
    exec "set diffopt-=algorithm:" . l:algo
  endfor
  exec "set diffopt+=algorithm:" . g:diff_algorithm
  echo "Diff algorithm switched to " . g:diff_algorithm
  windo diffupdate
endfunc

func! DiffUpdateContext(contextLines)
  let l:opt = substitute(&diffopt, '\v(^\|,)context:\d+', '', 'g') . ",context:" . a:contextLines
  exec "set diffopt=" . l:opt
  windo diffupdate
endfunc

func! ToggleDiffWhiteSpace()
  if stridx(&diffopt, "iwhite") >= 0
    set diffopt-=iwhite
    echo "Whitespaces NOT ignored in diff"
  else
    set diffopt+=iwhite
    echo "Whitespaces ignored in diff"
  endif
  windo diffupdate
endfunc

command! DiffSwitchAlgorithm call DiffSwitchAlgorithm()
command! DiffToggleWhiteSpace call DiffToggleWhiteSpace()
command! -nargs=1 DiffContext call DiffUpdateContext(<f-args>)

set diffopt+=internal,algorithm:patience
"set diffopt+=internal,algorithm:histogram

" }}}
" ########## Convenient yanks ##########{{{
"
"Yank a line without line break
nnoremap yuu mp_yg_`p
"Copy a line without line break to clipboard
nnoremap yuc mp_"+yg_`p
"Copy file path
nnoremap <silent> <space>cpp<space> :let @*=expand("%:p")<cr>:echo '-= File path copied=-'<cr>
"Copy file name
nnoremap <silent> <space>cpf<space> :let @*=expand("%:t")<cr>:echo '-= File name copied=-'<cr>
"Copy bookmark position reference
nnoremap <silent> <space>cpb<space> :let @*=expand("%:p").':'.line(".").':'.col(".")<cr>:echo '-= Cursor bookmark copied=-'<cr>

nnoremap <silent> <D-v> "*p
inoremap <silent> <D-v> <c-r>*
inoremap <silent> <nowait> ,v <c-r>*
cnoremap <silent> <nowait> ,v <c-r>*
"}}}
"########## EasyMotion ##########{{{
map  <Space>fj<Space> <Plug>(easymotion-j)
map  <Space>fk<Space> <Plug>(easymotion-k)
map  <Space>fl<Space> <Plug>(easymotion-bd-f)
nmap <Space>fjk<Space> V<Plug>(easymotion-bd-jk)
nmap <Space>fkj<Space> V<Plug>(easymotion-bd-jk)
map  gs/ <Plug>(easymotion-sn)
omap gs/ <Plug>(easymotion-tn)
map gsj <Plug>(easymotion-j)
map gsk <Plug>(easymotion-k)
map gss <Plug>(easymotion-bd-f)
" s{char}{char} to move to {char}{char}
" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" }}}
"########## MutiCursor ##########{{{
nmap <Leader>mc :MultipleCursorsFind<Space>
vmap <Leader>mc :<c-u>MultipleCursorsFind<Space>
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0
" }}}
"########## EasyAlign ##########{{{
vmap <CR> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
"########## LeaderF And Unite ##########{{{
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double

nnoremap <space>pf<space> :LeaderfFile<CR>
"nnoremap <space>pff<space> :Unite -direction=dynamicbottom -auto-resize file_rec/async<CR>
nnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -g !tags -g !tags.* -e %s", expand("<cword>"))<cr><cr>
xnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -g !tags -g !tags.* -e %s", leaderf#Rg#visual())<cr><cr>
nmap <space>fej<space> <space>efj<space>
xmap <space>fej<space> <space>efj<space>

nnoremap <space>efk<space> :Leaderf rg -F -g !tags -g !tags.* --stayOpen -e<space>
nmap <space>fek<space> <space>efk<space>

nnoremap <space>efjk<space> :<c-u>Leaderf! rg --recall<cr>
nmap <space>efkj<space> <space>efjk<space>

"nnoremap <space>efl<space> :<c-u>Unite -direction=dynamicbottom -auto-resize buffer<cr>
nnoremap <space>efl<space> :<c-u>LeaderfBuffer<cr>
nnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", expand("<cword>"))<cr><cr>
xnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efi<space> :<c-u>Leaderf line --nameOnly --input<space>
xnoremap <space>efi<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --nameOnly --input \"%s\" ", leaderf#Rg#visual())<cr>
"nnoremap <space>efo<space> :<c-u>TagbarToggle<cr>

nnoremap <space>efui<space> :<c-u>Leaderf! line --recall<cr>
nmap <space>efiu<space> <space>efui<space>

nnoremap <space>rof<space> :<c-u>LeaderfMru<cr>
"}}}
"########## Fix tmux clipboard in Mac ##########{{{
" set clipboard=unnamed
" }}}
"########## Color ##########{{{
" hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorLine cterm=NONE ctermbg=darkred guibg=darkred
" hi CursorLine term=bold cterm=bold ctermbg=237 guibg=Grey30
" hi Search term=underline cterm=underline ctermbg=240 ctermfg=red guibg=Grey30

" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" }}}
"########## PostgreSql ##########{{{
" au BufRead /tmp/psql.edit.* set syntax=sql
" }}}
"########## hledger integration ##########{{{
command! LedgerOpen :e $LEDGER_FILE
nnoremap <Leader><Leader>lo :LedgerOpen<CR>
noremap <Leader><Leader>ll :LedgerAlign<CR>
nnoremap <Leader><Leader>lu o; UUID: <ESC>:r !uuidgen<CR>kJgu$:s/-//g<CR>_

function! s:FnOpenLedgerBuffer() 
    if (bufexists('ledger.result'))
        let lrwin = bufwinnr('ledger.result')
        if (lrwin == -1)
            execute "vert belowright sb " . bufnr('ledger.result')
        else
            execute lrwin . 'wincmd w'
        endif
    else
        execute "rightb vnew ledger.result"
        setlocal bt=nofile bh=wipe nobl noswf
    endif
    normal! ggdG
    set syntax=ledger
endfunction

function! FnListLedgerAccounts()
    call s:FnOpenLedgerBuffer()
    0read !hledger accounts -I
    normal! Gdd
    exec "g/\\v^[^:]+$/normal! O------------------------------"
    exec "%s/^/    /"
    exec "%normal! A    "
    normal! gg
endfunction
command! LedgerAccounts call FnListLedgerAccounts()
nnoremap <Leader><Leader>la :LedgerAccounts<CR>

function! FnListLedgerTemplates()
    call s:FnOpenLedgerBuffer()
    0read !hledger p 'tag:Template-' -I
    normal! gg
endfunction
command! LedgerTemplates call FnListLedgerTemplates()
nnoremap <Leader><Leader>lt :LedgerTemplates<CR>

function! FnHLedgerRun(action)
    call s:FnOpenLedgerBuffer()
    execute "0read !hledger ".a:action
    exec "normal! ggOcommand > hlegder ".a:action
    normal! o--------------------
    normal! gg
endfunction
command! -nargs=1 HLedger call FnHLedgerRun(<f-args>)
nnoremap <Leader><Leader>lr :HLedger -V 

nnoremap <Leader><Leader>ld :r !date +"\%Y/\%m/\%d"<CR>kJA ! 
" }}}
"########## Mundo ##########{{{
set undofile
set undodir=~/.config/nvim/undo/
"}}}
"########## Sideway ##########{{{
"omap aa <Plug>SidewaysArgumentTextobjA
"xmap aa <Plug>SidewaysArgumentTextobjA
"omap ia <Plug>SidewaysArgumentTextobjI
"xmap ia <Plug>SidewaysArgumentTextobjI
"}}}
"########## Popup Buffers ##########{{{
func! ScratchBuffer(...)
  let l:key = a:0 > 0 ? a:1 : 'scratch'
  let l:direction = a:0 > 1 ? a:2 : 's'
  let l:link_to_file = a:0 > 2 ? a:3 : 0

  if (bufexists(l:key))
    let l:lrwin = bufwinnr(l:key)
    if l:lrwin == -1
      if a:direction ==? "v"
        exec "rightbelow vert sb " . bufnr(l:key)
      else
        exec "rightbelow sb " . bufnr(l:key)
      endif
    else
      exec l:lrwin . "wincmd w"
    endif
  else
    if l:direction ==? "v"
      exec "rightbelow vert new " . l:key
    else
      exec "rightbelow new " . l:key
    endif
    if !l:link_to_file
      setlocal bt=nofile
    endif
    setlocal bh=wipe nobl noswf nospell nonu
  endif
endfunc
"}}}
"########## sdvc ##########{{{

let g:sdcv_data_dir = "~/dev/stardict"

func! SdcvFoldOpen()
  foldopen
  if !(getline(".") =~ '^-->')
    call search('^-->', 'b')
    -1
  endif
endfunc

func! SdcvLookUp(word)
  norm! ggdG
  let l:sdcv_cmd = "sdcv -0 -n"
  if g:sdcv_data_dir != ''
    let l:sdcv_cmd = l:sdcv_cmd . " -2 " . g:sdcv_data_dir
  endif
  exec "norm! :0r !" . l:sdcv_cmd . " \"" . a:word . "\"\<cr>gg"

  " Remove wav file names
  silent! %s/\S\+\.wav//g

  " Reformat 牛津现代英汉双解词典
  silent! %s/ \* /\r    * /g
  silent! %s/  \d\d\? /\r\r\0/g

  call SdcvFoldDefinition()
  nnoremap zo :call SdcvFoldOpen()<cr>

  norm! gg
  call search("^-->")
  call SdcvFoldOpen()
endfunc

func! SdcvFoldDefinition()
  if !exists("b:is_sdcv_definition")
    return
  endif
  silent! norm! zEgg
  let l:title = search("^-->")
  while l:title > 0
    call search("^-->")
    let l:next_title = search("^-->")
    if l:next_title > 0
      exec l:title . "," . (l:next_title - 1) . "fold"
      let l:title = l:next_title
      call cursor(l:title, 1)
    else
      exec l:title . ",$" . "fold"
      let l:title = 0
    endif
  endwhile
  call cursor(1, 1)
endfunc

func! SdcvNextBook()
  if getline('.') =~ '^-->'
    exec line('.') + 1
  endif
  if getline('.') =~ '^-->'
    exec line('.') + 1
  endif
  let l:next_title = search('^-->', 'n')
  if l:next_title > 0
    norm! zm
    exec l:next_title
    call SdcvFoldOpen()
  endif
endfunc

func! SdcvPrevBook()
  if !(getline('.') =~ '^-->')
    call search('^-->', 'b')
  endif
  if getline('.') =~ '^-->'
    exec line('.') - 1
  endif
  if getline('.') =~ '^-->'
    exec line('.') - 1
  endif
  let l:next_title = search('^-->', 'b')
  if l:next_title > 1
    norm! zm
    exec max([l:next_title - 1, 1])
    call SdcvFoldOpen()
  endif
endfunc

func! SdcvDefinitionBufferInit(word)
  let b:is_sdcv_definition = 1
  setlocal bt=nofile bh=wipe nobl noswf nospell nonu
  " Key Mappings
  nnoremap <buffer> <silent> q :bwipeout<cr>

  " Highlights
  if !exists("b:current_syntax")
    let b:current_syntax = "stardict"

    syntax match stardictKeyword "\v\c<%(UK|US|countable|uncountable|BrE|NAmE|AmE|nouns?|verbs?|adverbs?|adjectives?|%(in)?transitive|adv|n|alt|vb|prep|%(in)?formal|plural|see also)>"
    syntax match stardictResult "\v^[A-Z].*"
    syntax match stardictWord "\v^\@.*"
    syntax match stardictWord2 "\v^--\>\zs.*"
    syntax match stardictWordType "\v^\*.*"
    syntax match stardictWordMeaning "\v^[0-9].*"
    syntax match stardictWordExample "\v^(    \-\s.*\:|\!.*|    \-\s.*)"
    syntax match stardictDictName "\v^\@[^/]*\:[^/]*"
    syntax match stardictPronounce "\v^\/.{0,30}\/"
    syntax match stardictBracket "\v\(.{0,10}\)"
    syntax match stardictSquareBracket "\v\[.{0,10}\]"
    syntax match stardictNumber "\v<\d{0,2}>"

    highlight link stardictResult Special
    highlight link stardictWord Todo
    highlight link stardictWord2 Todo
    highlight link stardictWordType Statement
    highlight link stardictWordMeaning Identifier
    highlight link stardictWordExample Type
    highlight link stardictDictName Underlined
    highlight link stardictPronounce Statement
    highlight link stardictBracket Statement
    highlight link stardictSquareBracket Statement
    highlight link stardictNumber PreProc
    highlight link stardictKeyword Identifier
  endif

  exec 'syntax match SdvcLookupWord /\c\V\<' . a:word . '/'
  highlight default link SdvcLookupWord Underlined
endfunc

func! Say(word) abort
  call system("say \"". a:word . "\"")
endfunc

nnoremap <silent> ,dd viw"ay:call ScratchBuffer('word.definition', 's'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dd "ay:call ScratchBuffer('word.definition', 's'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
nnoremap <silent> ,dD viw"ay:rightbelow new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dD "ay:rightbelow new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dv viw"ay:call ScratchBuffer('word.definition', 'v'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dv "ay:call ScratchBuffer('word.definition', 'v'):call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
nnoremap <silent> ,dV viw"ay:rightbelow vert new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dV "ay:rightbelow vert new:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dt viw"ay:tabnew:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")
vnoremap <silent> ,dt "ay:tabnew:call SdcvDefinitionBufferInit("a"):call SdcvLookUp("a")

nnoremap <silent> ,dr mpviw"ay:call Say("a")`p
vnoremap <silent> ,dr mp"ay:call Say("a")`p

nnoremap <silent> ,dR  :e ~/dev/vim-recite/wordmemo_daniel_daily.vim<CR>:call search("^\"=== End Words ===")<CR>zz
nnoremap <silent> ,dG  :e ~/dev/vim-recite/wordmemo_daniel_game.vim<CR>:call search("^\"=== End Words ===")<CR>zz

nnoremap <silent> ,df :call SdcvFoldDefinition()<CR>
nnoremap <silent> ,dn :call SdcvNextBook()<CR>
nnoremap <silent> ,dp :call SdcvPrevBook()<CR>

command! Recite tabnew ~/dev/vim-recite/
"}}}
"########## Macro Related ##########{{{
nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>mC :<c-u><c-r><c-r>='command! norm! '. string(getreg(v:register))<cr><c-f><esc>0Ea<space>

nnoremap QQ @q
vnoremap QQ :norm! @q<cr>
nnoremap QR :if @q !~ '@q$' \| let @q=@q.'@q' \| endif<cr>@q
"}}}
"########## Others ##########{{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

" cd project root
command! CDR cd %:h | cd `git rev-parse --show-toplevel`
" cd module root
command! CDM cd %:h | exec 'cd' fnameescape(fnamemodify(findfile("pom.xml", escape(expand('%:p:h'), ' ') . ";"), ':h'))
" cd current folder
command! CDF cd %:h

""" Auto commit message when executing `git commit`
command! TACommitMessage norm! :5t.df/oggddf-;lgUl:s/-/ /gElr-0:nohlI[Ea]ll

""" Auto insert TODO comment with branch ticket number
command! TATodo exec "norm! a TODO :r !git name-rev --name-only HEADkJdf/2f-Da " | startinsert!

""" Format JSON String
command! TAFmtJson norm! :%!jq -S:setl ft=json fdm=syntax:syn onggzMzo

""" Wrap the selected comment with `=`, use in visual mode with <CTRL-U>
command! TACommentBox norm! `<`>``yyP_Wv$r=$5a=yy``p

""" PDF book
function! PDFBookStartFn(paperPerPart, startPage)
    let l:endPage = a:startPage - 1 + a:paperPerPart * 4 - 6
    exec 'norm! A "'.a:startPage.',1,1,1,1,1,'.a:startPage.'-'.l:endPage.'"'
endfunction

function! PDFBookNextFn(paperPerPart)
  norm! yypf"f-l
  let l:previousPage = str2nr(expand("<cword>"))
  exec 'norm! ci"' . (l:previousPage + 1) . '-' . (l:previousPage + 4 * a:paperPerPart)
endfunction

function! PDFBookEndFn(paperPerPart, notePapers)
  norm! yypf"f-l
  let l:previousPage = str2nr(expand("<cword>"))
  let l:offset = 2 * a:notePapers + 6
  exec 'norm! ci"' . (l:previousPage + 1) . '-' . (l:previousPage + 4 * a:paperPerPart - l:offset)
  if (a:notePapers > 0)
    exec 'norm! ' . (a:notePapers * 2) . 'a,2'
  endif
  norm! 6a,1
  call PDFBookNextBookFn(a:paperPerPart)
endfunction

function! PDFBookNextBookFn(paperPerPart)
    norm! vipygPO
    norm! jvipkojdf"f-l
    let l:previousPage = str2nr(expand("<cword>"))
    exec "norm! dd{j0f\"f-T,vt-c" . (l:previousPage + 1) . "\<esc>f-lce" . (l:previousPage + (4 * a:paperPerPart) - 6)
endfunction

function! PDFBookFinalFn(papersPerPart, lastPage, notePapers)
    norm! yyp0f"f-l"
    let l:previousPage = str2nr(expand("<cword>"))
    let l:expectedLast = l:previousPage + (4 * a:papersPerPart) - 6 - (2 * a:notePapers)
    if (a:lastPage >= l:previousPage && a:lastPage <= l:expectedLast)
        let l:offset = l:expectedLast - a:lastPage
        let l:actualNotePages = l:offset + a:notePapers * 2
        exec 'norm! ci"' . (l:previousPage + 1) . '-' . a:lastPage
        if (l:actualNotePages > 0)
            exec 'norm! ' . l:actualNotePages . 'a,2'
        endif
        norm! 6a,1
    else
        echoerr 'last page' . a:lastPage . ' out of range ('. l:previousPage . ', ' . l:expectedLast . ']'
        delete
    endif
endfunction

command! -nargs=* PDFBookStart :call PDFBookStartFn(<f-args>)
command! -nargs=* PDFBookNext :call PDFBookNextFn(<f-args>)
command! -nargs=* PDFBookEnd :call PDFBookEndFn(<f-args>)
command! -nargs=* PDFBookNextBook :call PDFBookNextBookFn(<f-args>)
command! -nargs=* PDFBookFinal :call PDFBookFinalFn(<f-args>)

""" Front commands
command! JFPrecommit norm! ggdG:0r !yarn precommit<CR>gg
command! JFFlowStatus norm! ggdG:0r !yarn dev flow status<CR>gg

""" Convert ps -ef output to Kill -9
command! -range Kill9 <line1>,<line2>:norm! 0vEckill -9ElD0

""" Insert current date at the beginning of a line
command! -range Date <line1>,<line2>:norm! I=strftime('%Y-%m-%d') 

""" MRU
let MRU_Max_Entries=9999
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*\|_LOCAL_\d\+\.\|_REMOTE_\d\+\.\|_BASE_\d\+\.'
nnoremap <space>fr<space> :MRU<CR>
nnoremap <space>fR<space> :tabnew ~/.vim_mru_files<CR>

"}}}
"########## NeoVim ##########{{{
if has('nvim')
  func! ClearTerm()
    let l:scrollback_backup=&scrollback
    set scrollback=1
    call feedkeys("\i")
    call feedkeys("clear\<CR>")
    call feedkeys("\<C-\>\<C-n>")
    call feedkeys("\i")
    sleep 1000m
    let &scrollback=l:scrollback_backup
  endfunc

  tnoremap <ESC> <C-\><C-n>
endif
" }}}
"########## Neovide ##########{{{
  "let g:neovide_cursor_vfx_mode = "railgun"
  "let g:neovide_cursor_vfx_mode = "pixiedust"
  let g:neovide_cursor_vfx_mode = "sonicboom"
  "let g:neovide_cursor_vfx_mode = "ripple"
  let g:neovide_cursor_animation_length=0.07
  let g:neovide_cursor_trail_length=4.0
"" }}}
"########## Font ##########{{{
let g:guifontname = 'DroidSansMono\ Nerd\ Font\ Mono,Cascadia\ Code,Sarasa\ Mono\ SC\ Nerd'
let s:default_guifontheight = 22
let g:guifontheight = s:default_guifontheight
exec "set guifont=" . g:guifontname . ":h" . string(g:guifontheight)

function! FunChangeFontSize(...)
  if a:0 == 0
    let l:h = s:default_guifontheight
  elseif type(a:1) == 1
    let l:h = str2nr(a:1)
  elseif a:1 > 8
    let l:h = a:1
  else
    let l:h = max([9, g:guifontheight + a:1])
  endif
  let g:guifontheight = l:h
  execute "set guifont=" . g:guifontname . ":h" . l:h
endfunction
command! -nargs=* ChangeFontSize call FunChangeFontSize(<f-args>)
command! IncreaseFontSize call FunChangeFontSize(1)
command! DecreaseFontSize call FunChangeFontSize(-1)
nnoremap <C-=> :call FunChangeFontSize(1)<CR>
nnoremap <C--> :call FunChangeFontSize(-1)<CR>
nnoremap <A-0> :call FunChangeFontSize()<CR>
"}}}
"########## Capture CLI output in a scratch buffer ##########{{{
command! -nargs=* -complete=shellcmd R :call ScratchBuffer('shell.output', 's') | r !<args>
command! -nargs=* -complete=shellcmd RV :call ScratchBuffer('shell.output', 'v') | r !<args>

command! -range ExecVimL call execute(getline(<line1>, <line2>), '')
vnoremap <space>r<space> :ExecVimL<cr>:<c-u>echo "Selected range executed"<cr>
nnoremap <space>r<space> :ExecVimL<cr>:<c-u>echo "Current line executed"<cr>
"}}}
"########## vim-marks (Disabled) ##########{{{
"nmap <space>m<space> <Plug>ToggleMarkbar
"}}}
"########## mark.vim ##########{{{
nmap <silent> <space>fdj<space> <Plug>MarkSet
vmap <silent> <space>fdj<space> <Plug>MarkSet
nmap <silent> <space>fdk<space> <Plug>MarkRegex
vmap <silent> <space>fdk<space> <Plug>MarkRegex
nmap <silent> <space>fdl<space> <Plug>MarkClear
"}}}
"########## Treesitter ##########{{{
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, textobjects = { enable = true } }
lua << EOF
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
EOF
"}}}
"########## AsyncRun ##########{{{
let $PYTHONUNBUFFERED=1
let g:asyncrun_open=8
let g:terminal_height=15
let g:terminal_kill='term'
let g:terminal_close=1
let g:terminal_key='<space>dfm<space>'
"}}}
"########## Quick UI ##########{{{
let g:quickui_color_scheme="default"
"}}}
"########## Git ##########{{{
let g:fugitive_summary_format = "%as-[%an]: %s"
nnoremap <space>dsj<space> :Git log --pretty=format:"%h\|\|%as-[%an]: %s" -- %<cr>
nnoremap <space>dsjk<space> :0Glog -- %<cr>
nmap <space>dskj<space> <space>dsjk<space>
nnoremap <space>dsk<space> 0"ayiw:bw<cr>:rightbelow Gvdiff <c-r>a<cr>
"}}}
"########## Project Bookmarks #########{{{
let g:project_bookmark = {
      \'java': '~/dev/java',
      \'jf': '~/dev/jfrontend/',
      \'dict': '~/.local/share/nvim/plugged/vim-dict/dict/',
      \}
func! s:go_bookmark(bookmark)
  if has_key(g:project_bookmark, a:bookmark)
    exec 'cd ' . get(g:project_bookmark, a:bookmark)
    echo "cd " . get(g:project_bookmark, a:bookmark)
  else
    echo "Undefined bookmark: " . a:bookmark
  endif
endfunc
command! -nargs=* Go call s:go_bookmark(<f-args>)
command! -nargs=* Got call s:go_bookmark(<f-args>) | tabnew | e .
"}}}
"########## Current Ticket Notes ##########{{{
let g:ticket="TK-817"
let g:project_temp_folder='~/dev/vim_project_temp'
func! s:ensureTicketNotesFolder()
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if empty(glob(l:temp_folder))
    call system('mkdir -p ' . l:temp_folder)
  endif
  return l:temp_folder
endfunc
func! s:SetCurrentTicket(...)
  if a:0 == 0
    let g:ticket = input("Ticket #:")
  else
    let g:ticket = a:1
    echo "Current Project ticket set to " . g:ticket
  endif
endfunc
func! s:TicketNotesListFolder()
  let l:temp_folder = s:ensureTicketNotesFolder()
  exec 'edit ' . l:temp_folder
endfunc
func! s:TicketNoteEdit(...)
  let l:temp_folder = s:ensureTicketNotesFolder()
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:note_name = a:1
  endif
  exec 'edit ' . l:temp_folder . '/' . l:note_name
endfunc
func! s:TicketNoteSave(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:note_name = a:1
  endif
  exec 'saveas ' . l:temp_folder . '/' . l:note_name
endfunc

command! -nargs=* TicketSetCurrent call s:SetCurrentTicket(<f-args>)
command! TicketNotesListFolder call s:TicketNotesListFolder()
command! -nargs=* TicketNoteEdit call s:TicketNoteEdit(<f-args>)
command! -nargs=* TicketNoteSave call s:TicketNoteSave(<f-args>)
nnoremap <silent> <space>tn<space> :TicketNoteEdit notes.org<cr>
nnoremap <silent> <space>tf<space> :TicketNotesListFolder<cr>

command! Todo exec "norm! :\<C-U>\<C-R>=printf(\"Leaderf! rg -F -e '%s'\", \"TODO \" . g:ticket)\<CR>\<CR>"
command! TBookmark exec "norm! :\<C-U>\<C-R>=printf(\"Leaderf! rg -F -e '%s'\", \"BOOKMARK \" . g:ticket)\<CR>\<CR>"
nmap ,td aTODO <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
imap ,td  TODO <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
nmap ,tm aBOOKMARK <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
imap ,tm  BOOKMARK <c-r>=g:ticket<cr><space>$<esc>gcc_f$s
nnoremap <space>t<space> <c-w>gF
"}}}
"########## IDE integration ##########{{{
func! s:getBookmarkUnderCursor(text, pos)
  "Find the start location
  let p = a:pos
  while p >= 0 && a:text[p] =~ '\f'
    let p = p - 1
  endwhile
  let p = p + 1
  "Match file name and position
  let l:m = matchlist(a:text, '\v(\f+)%([#:](\d+))?%(:(\d+))?', p)
  if len(l:m) > 0
    return [l:m[1], l:m[2], l:m[3]]
  endif
  return []
endfunc
func! s:OpenFileLinkInIdea(text, pos, ide)
  let l:location = s:getBookmarkUnderCursor(a:text, a:pos)
  if l:location[0] != ''
    if l:location[1] != ''
      if l:location[2] != ''
        let l:command = a:ide . " --column " . str2nr(l:location[2]) . " " . l:location[0] . ":" . str2nr(l:location[1])
        echo l:command
        exec "AsyncRun -silent " . l:command
      else
        let l:command = a:ide . " " . l:location[0] . ":" . str2nr(l:location[1])
        echo l:command
        exec "AsyncRun -silent " . l:command
      endif
    else
      let l:command = a:ide . " " . l:location[0]
      echo l:command
      exec "AsyncRun -silent " . l:command
    endif
  else
    echo "Not a valid file path"
  endif
endfunc

command! OpenFileLinkInIdea call s:OpenFileLinkInIdea(getline("."), col("."), "idea")
command! OpenFileLinkInWebStorm call s:OpenFileLinkInIdea(getline("."), col("."), "webstorm")
" Open a file link under cursor in idea
nnoremap <space>idle<space> :OpenFileLinkInIdea<cr>
" Open a file link under cursor in webstorm
nnoremap <space>idlw<space> :OpenFileLinkInWebStorm<cr>
" Open the current file in idea
nnoremap <space>ide<space> :<c-r>=printf("AsyncRun -silent idea %s:%d", expand("%:p"), line("."))<cr><cr>
" Open the current file in webstorm
nnoremap <space>idw<space> :<c-r>=printf("AsyncRun -silent webstorm %s:%d", expand("%:p"), line("."))<cr><cr>
"}}}
"########## Merge ##########{{{
let s:mergeSources = {
      \  'L':      1,
      \  'LOCAL':  1,
      \  'B':      2,
      \  'BASE':   2,
      \  'R':      3,
      \  'REMOTE': 3,
      \  'M':      4,
      \  'MERGE':  4,
      \}

func! init#createMergeTab(...)
  " Map source name to buffer number
  if a:0 > 0
    let l:sources = []
    for item in a:000
      if has_key(s:mergeSources, toupper(item))
        call add(l:sources, get(s:mergeSources, toupper(item)))
      else
        echo 'Unrecognized source: ' . item
        return
      endif
    endfor
  else
    let l:sources = [1, 4, 3]
  endif

  let l:mergeBufIndex = max([index(l:sources, 4), 0]) + 1

  tabnew
  let i = 0
  while i < len(l:sources) - 1
    exec 'buf ' . l:sources[i]
    rightbelow vsp
    let i = i + 1
  endwhile
  exec 'buf ' . l:sources[i]
  windo diffthis
  exec l:mergeBufIndex . 'wincmd w'
endfunc

command! -nargs=* MergeTab call init#createMergeTab(<f-args>)
"}}}
"########## vim-auto-popmenu ##########{{{
" Take effect in the following file types, * for all types
let g:apc_enable_ft = {'text':1, 'markdown':1, 'javascript':1, 'java':1, 'org':1}

" Source from dictionary and current file
set cpt=.,k,w,b
" Don't auto select the first item
set completeopt=menu,menuone,noselect
" Prevent trivial information at the bottom
set shortmess+=c
"}}}
"########## Snippet ##########{{{
"UltiSnippet
let g:UltiSnipsEditSplit="context"

let g:UltiSnipsExpandTrigger=",l"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


" maps
"inoremap ,l <c-\><c-o>:call UltiSnips#ExpandSnippet()<cr>

"}}}
"########## nvim colorcoder ##########{{{
let g:colorcoder_enable_filetypes = ['java', 'xml', 'yaml', 'js', 'soy', 'org']
"}}}
"########## Lightline ##########{{{
" Let kcsongor/vim-tabbar deal with tabline
let g:lightline = {
      \    'enable': {
      \        'statusline': 1,
      \        'tabline': 0
      \    }
      \}
"}}}
"########## Tabbar ##########{{{
set tabline=%!tabbar#tabline()
command! -nargs=* RenameTab call tabbar#rename_current_tab(<f-args>)
"}}}
"########## Choose Win ##########{{{
nmap - <Plug>(choosewin)
nmap <TAB>, <Plug>(choosewin)
" Use overlay feature
let g:choosewin_overlay_enable = 0
"}}}

let mapleader='\'
nohl

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}
