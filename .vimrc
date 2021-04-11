set nocompatible

filetype off                  " required
set encoding=utf-8            " required by YCM

"   Plugins {{{
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-fugitive.git' " Git integration
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Yggdroot/LeaderF.git'
Plug 'https://github.com/mkarmona/colorsbox.git'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'https://github.com/ledger/vim-ledger.git'
"Plug 'rbgrouleff/bclose.vim'  " Needed by ranger
"Plug 'francoiscabrol/ranger.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'gaving/vim-textobj-argument'
Plug 'sophacles/vim-processing'
Plug 'dhruvasagar/vim-table-mode'
Plug 'https://github.com/dengzhizhi/vim-spl.git'
Plug 'gyim/vim-boxdraw'
Plug 'nathangrigg/vim-beancount'
Plug 'pangloss/vim-javascript'  "Just better syntax heighlighting
Plug 'nathangrigg/vim-beancount'
Plug 'yegappan/mru'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'axvr/org.vim'

"Plug 'https://github.com/AndrewRadev/sideways.vim.git'
"Plug 'https://github.com/airblade/vim-rooter.git'

"Plug 'https://github.com/vim-scripts/SyntaxRange.git'
"Plug 'https://github.com/chrisbra/csv.vim.git'
"Plug 'benmills/vimux'
"Plug 'jtdowney/vimux-cargo'
"Plug 'uarun/vim-protobuf'
"Plug 'vim-scripts/LargeFile'
"Plug 'https://github.com/jceb/vim-orgmode.git'
"Plug 'https://github.com/nathangrigg/vim-beancount.git'
"Plug 'https://github.com/elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'beeender/Comrade'  " Intellij integration
"Plug 'https://github.com/kana/vim-submode.git'
"Plug 'https://github.com/gcmt/taboo.vim.git'
"Plug 'lifepillar/vim-cheat40'
"Plug 'xavierchow/vim-swagger-preview'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
"Plug 'chrisbra/vim-diff-enhanced'
"Plug 'junegunn/gv.vim' " Git log
"Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
"Plug 'rhysd/vim-grammarous'  " Grammar check
"
" COC
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh', 'branch': 'release'}
"
"Colorschemes
Plug 'https://github.com/mkarmona/colorsbox.git'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

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
" }}}

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

"Colorschemes {{{
colo colorsbox-steighties
"colo github
"colo materialbox
" }}}

"########## Developer Settings ##########"
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
set nospell
set thesaurus+=~/.config/dictionary/moby_thesaurus.txt

"########## Insert Mode Shortcuts ##########{{{
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
"}}}

" pangloss/vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

set conceallevel=0
let g:javascript_conceal_function                  = "⨎"
"let g:javascript_conceal_null                      = "⦰"
let g:javascript_conceal_this                      = "🙋"
let g:javascript_conceal_return                    = "👈"
let g:javascript_conceal_undefined                 = "💥"
map <space>dsj<space> :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
" }}}
"########## Insert mode j Combinations ##########" {{{
inoremap jk <ESC>
inoremap jl <Right>
inoremap jh <Left>
" }}}

"########## Fighter Keybindings ##########" {{{
nnoremap <Space>su<Space> :NERDTreeFocus<CR>
nnoremap <Space>sui<Space> :NERDTreeClose<CR>
nnoremap <Space>siu<Space> :NERDTreeClose<CR>
nnoremap <Space>so<Space> :NERDTreeToggle<CR>
nnoremap <Space>si<Space> :NERDTreeFind<CR>

nnoremap <Space>sdfj<Space> :Gblame<CR>
nnoremap <Space>sdfk<Space> :GlLog %<CR>
nnoremap <Space>sdfl<Space> :GlLog<CR>

nnoremap <Space>sf<Space> <C-I>
nnoremap <Space>ss<Space> <C-O>
" }}}
"########## Ranger ##########" {{{
"let g:ranger_map_keys = 0
"let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
"let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" }}}

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

nnoremap <TAB>i <C-I>

nnoremap <TAB>, 10<C-W><
nnoremap <TAB>. 10<C-W>>
" }}}
"########## Folds ##########{{{
"Fold by keyword
nnoremap <Leader>z/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
vnoremap <Leader>z* "sy:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
nnoremap <Leader>z* "syiw:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"Fold except selection
vnoremap <Leader>zv <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<
"}}}
"Adjust up/down {{{
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k
" }}}
"#################### Tab Enhancement ####################{{{
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
let mapleader="\"
set timeoutlen=5000

""" Diff Option {{{
set diffopt+=context:20
let g:diff_algorithms = [
      \ "myers",
      \ "minimal",
      \ "patience",
      \ "histogram",
      \ ]
let g:diff_algorithm = "patience"

func! SwitchDiffAlgorithm()
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
endfunc

command! SwitchDiffAlgorithm call SwitchDiffAlgorithm()

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
nnoremap <silent> <space>cpp<space> :let @*='<c-r>=expand("%:p")<cr>'<cr>:echo '-= File path copied=-'<cr>
"Copy file name
nnoremap <silent> <space>cpf<space> :let @*='<c-r>=expand("%:t")<cr>'<cr>:echo '-= File name copied=-'<cr>
"Copy bookmark position reference
nnoremap <silent> <space>cpb<space> :let @*='<c-r>=expand("%:p")<cr>:<c-r>=line(".")<cr>:<c-r>=col(".")<cr>'<cr>:echo '-= Cursor bookmark copied=-'<cr>

nnoremap <silent> <D-v> "*p
inoremap <silent> <D-v> <c-r>*
"}}}
" ######## EasyMotion ######## {{{
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
" EasyAlign {{{
vmap <CR> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" LeaderF {{{
nnoremap <Leader>pp :LeaderfFile<CR>
nnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg -F -e %s", expand("<cword>"))<cr><cr>
xnoremap <space>efj<space> :<c-u><c-r>=printf("Leaderf! rg -F -e %s", leaderf#Rg#visual())<cr><cr>

nnoremap <space>efk<space> :Leaderf rg -F --stayOpen -e<space>

nnoremap <space>efjk<space> :<c-u>Leaderf! rg --recall<cr>
nmap <space>efkj<space> <space>efjk<space>

nnoremap <space>efl<space> :<c-u>LeaderfBuffer<cr>
nnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --input %s", expand("<cword>"))<cr><cr>
xnoremap <space>efu<space> :<c-u><c-r>=printf("Leaderf line --stayOpen --input %s", leaderf#Rg#visual())<cr><cr>
nnoremap <space>efi<space> :<c-u>Leaderf line<cr>

nnoremap <space>efui<space> :<c-u>Leaderf! line --recall<cr>
nmap <space>efiu<space> <space>efui<space>

nnoremap <space>rof<space> :<c-u>LeaderfMru<cr>
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

set rtp+=/usr/local/opt/fzf

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
"Others {{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

" cd project root
command! CDR cd %:h | cd `git rev-parse --show-toplevel`
" cd module root
command! CDM cd %:h | exec 'cd' fnameescape(fnamemodify(findfile("pom.xml", escape(expand('%:p:h'), ' ') . ";"), ':h'))
" cd current folder
command! CDF cd %:h

nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>mC :<c-u><c-r><c-r>='command! norm! '. string(getreg(v:register))<cr><c-f><esc>0Ea<space>

"}}}
"Predefined Macro {{{
let @t = '@q@t'
"}}}

"sdvc {{{

let g:sdcv_data_dir = "~/dev/zhizhi/stardict"

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
  let s:say_job = job_start("say \"". a:word . "\"")
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

nnoremap <silent> ,dR  :e ~/dev/zhizhi/vim-recite/wordmemo_daniel_daily.vim<CR>:call search("^\"=== End Words ===")<CR>zz

nnoremap <silent> ,df :call SdcvFoldDefinition()<CR>
nnoremap <silent> ,dn :call SdcvNextBook()<CR>
nnoremap <silent> ,dp :call SdcvPrevBook()<CR>

command! Recite tabnew ~/dev/zhizhi/vim-recite/
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

""" Format JSON String
command! TAFmtJson norm! :%!jq -S:setl ft=json fdm=syntax:syn onggzMzo

""" Format Solr entity
command! TAFmtSolrEntity norm! :syn off:setl fdm=manualzE:v/^\s*"entity[^"]*":/d0dt{$T}D:s/\%(\\\)\@<!\\"/"/ge:s/\\\\\\"/\\"/ge:TAFmtJson

""" Generate UUID in unnamed register
command! TAuuid norm! ma:r !uuidgenyg_"_dd`a

""" Convert ps -ef output to Kill -9
command! -range Kill9 <line1>,<line2>:norm! 0vEckill -9ElD0

""" Insert current date at the beginning of a line
command! -range Date <line1>,<line2>:norm! I=strftime('%Y-%m-%d')
 
""" MRU
nnoremap <space>fr<space> :MRU<CR>
nnoremap <space>fR<space> :tabnew ~/.vim_mru_files<CR>

"}}}
"Font {{{
let g:guifontname = 'Cascadia\ Code,Sarasa\ Mono\ SC\ Nerd'
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
"########## Current JIRA Ticket Notes ##########{{{
let g:ticket="JDAG-515"
let g:project_temp_folder='~/dev/vim_jira_project_temp'
func! s:SetCurrentTicket(...)
  if a:0 == 0
    let g:ticket = input("Ticket #:")
  else
    let g:ticket = a:1
    echo "Current Project ticket set to " . g:ticket
  endif
endfunc
func! s:TicketNotesListFolder()
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if empty(glob(l:temp_folder))
    call system('mkdir -p ' . l:temp_folder)
  endif
  exec 'edit ' . l:temp_folder
endfunc
func! s:TicketNoteEdit(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:note_name = a:1
  endif
  exec 'edit ' . l:temp_folder . '/' . l:note_name
endfunc
func! s:SaveTicketNote(...)
  let l:temp_folder = g:project_temp_folder. '/' . g:ticket
  if a:0 == 0
    let l:note_name = input("Note name:")
  else
    let l:note_name = a:1
  endif
  exec 'saveas ' . l:temp_folder . '/' . l:note_name
endfunc

command! -nargs=* SetCurrentTicket call s:SetCurrentTicket(<f-args>)
command! TicketNotesListFolder call s:TicketNotesListFolder()
command! -nargs=* TicketNoteEdit call s:TicketNoteEdit(<f-args>)
command! -nargs=* TicketNoteSave call s:TicketNoteSave(<f-args>)
command! Todo exec "norm! :\<C-U>\<C-R>=printf(\"Leaderf! rg -F -e '%s'\", \"TODO \" . g:ticket)\<CR>\<CR>"
command! Portal call ScratchBuffer(g:ticket . '_portal', 's', 1) | call s:TicketNoteEdit('portal.org')
nnoremap <silent> <space>tp<space> :TicketNoteEdit portal.org<cr>
"}}}
"########## Capture CLI output in a scratch buffer ##########{{{
command! -nargs=* -complete=shellcmd R :ScratchBuffer('shell.output', 's') | r !<args>
command! -nargs=* -complete=shellcmd RV :ScratchBuffer('shell.output', 'v') | r !<args>
au FileType vim vnoremap <buffer> <space>r<space> "jy:<c-u>@j<cr>:<c-u>echo "Selected command executed"<cr>
au FileType vim vnoremap <buffer> <c-cr> "jy:<c-u>@j<cr>:<c-u>echo "Selected command executed"<cr>
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
" vim: set ts=2 sts=-1 sw=0 et tw=240 ft=vim fdm=marker:
" }}}

