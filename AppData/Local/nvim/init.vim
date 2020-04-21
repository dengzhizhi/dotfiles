"Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
set nocompatible
"   Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-fugitive.git' " Git integration
Plug 'junegunn/gv.vim' " Git log
Plug 'https://github.com/scrooloose/nerdtree.git'
"Plug 'https://github.com/Yggdroot/LeaderF.git'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'https://github.com/mkarmona/colorsbox.git'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rhysd/vim-grammarous'  " Grammar check
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'https://github.com/skywind3000/asyncrun.extra.git'
Plug 'https://github.com/ledger/vim-ledger.git'
Plug 'whiteinge/diffconflicts'
Plug 'simnalamburt/vim-mundo'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'gaving/vim-textobj-argument'
Plug 'xavierchow/vim-swagger-preview'
Plug 'sophacles/vim-processing'
Plug 'machakann/vim-highlightedyank'

Plug 'nathangrigg/vim-beancount'
Plug 'phongvcao/vim-stardict'

Plug 'vim-scripts/indentpython.vim'
call plug#end()
" }}}

"Colorschemes
colo atom

"########## Developer Settings ########## {{{
"let g:guifontname = 'DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete'
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
"set relativenumber
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
" }}}

" emacs hybrid mappings {{{
inoremap <C-A> <ESC>I
inoremap <C-E> <ESC>A
inoremap <C-F> <C-O>a
inoremap <C-B> <ESC>i
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

nnoremap <Space>sj<Space> :Grepper<CR>

nnoremap <Space>sdfj<Space> :Gblame<CR>
nnoremap <Space>sdfk<Space> :GlLog %<CR>
nnoremap <Space>sdfl<Space> :GlLog<CR>
nnoremap <Space>sdflk<Space> :GV<CR>
nnoremap <Space>sdfkl<Space> :GV<CR>
" }}}


"########## Ranger ##########" {{{
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
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
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgray
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgray guibg=black
"}}}

"########## Insert Mode Shortcuts ########## {{{
inoremap <M-h> <ESC>i
inoremap <M-l> <ESC>la
"}}}

"Swap
"vnoremap <C-S-X> <ESC>`.``gvp``P

"Fold by keyword
nnoremap <Leader>z/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
vnoremap <Leader>z* "sy:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
nnoremap <Leader>z* "syiw:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"Fold except selection
vnoremap <Leader>zv <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<

" @t repeat @q
let @t="@q@t"

"Remove blank lines
"map <Leader>R :g/^$/d<CR>gv:s/^\s*//<CR>

"Uppercase
"nmap <C-S-U> gUiwe
"imap <C-S-U> <ESC>gUiwgi

"normal command
"nnoremap <Leader><Leader>n :%norm 

"Adjust up/down {{{
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" }}}

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

" Python {{{
let g:python3_host_prog='C:\Users\zhizh\AppData\Local\Programs\Python\Python39\python.exe'
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
" }}}

let mapleader=" "

"nmap <Leader><Leader>s :set syntax=
"nmap <Leader><Leader>e :vnew\|0r !
"nmap <Leader><Leader>r :w!<CR>:AsyncRun! elixir %<CR>

function! RunShellInNewBuffer()
    let l:s = input("Shell command: ")
    execute "vnew|0read !".l:s
endfunction
command! RunShellInNewBuffer call RunShellInNewBuffer()

" ########## Copy to bottom ######### {{{
function! CopyToBottom()
    let l:a = input("Copy to bottom with Regex: ")
    execute "g/".l:a."/t$"
endfunction
noremap <Leader>zg :call CopyToBottom()<CR>
" }}}

command! DeleteBlankLine g/^\s*$/d
 
" ######## Enhanced Diff ######## {{{
" autocmd VimEnter * EnhancedDiff histogram
" }}}

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
  windo diffupdate
endfunc

func! UpdateDiffContext(contextLines)
  let l:opt = substitute(&diffopt, '\v(^\|,)context:\d+', '', 'g') . ",context:" . a:contextLines
  exec "set diffopt=" . l:opt
  windo diffupdate
endfunc

command! SwitchDiffAlgorithm call SwitchDiffAlgorithm()
command! -nargs=1 DiffContext call UpdateDiffContext(<f-args>)

set diffopt+=internal,algorithm:patience
"set diffopt+=internal,algorithm:histogram

" }}}

" ######## EasyMotion ######## {{{
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)
map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
map <Space>fj<Space> <Plug>(easymotion-j)
map <Space>fk<Space> <Plug>(easymotion-k)
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

" Grepper {{{
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <Leader>g :Grepper<CR>
let g:grepper = { 'next_tool': '<leader>g' }
let g:grepper.ag = { 'grepprg': 'ag --vimgrep --' }
let g:grepper.searchreg = 1

" }}}

" MutiCursor {{{
nmap <Leader>mc :MultipleCursorsFind<Space>
vmap <Leader>mc :MultipleCursorsFind<Space>
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0
" }}}

" EasyAlign {{{
vmap <CR> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" LeaderF {{{
nnoremap <Leader>pp :LeaderfFile<CR>
nnoremap <Leader>p* <Plug>(LeaderfRgCwordLiteralBoundary)
vnoremap <Leader>p* <Plug>(LeaderfRgVisualLiteralNoBoundary)
nnoremap <Leader>L :Leaderf line<CR>
"}}}

" PostgreSql {{{
au BufRead /tmp/psql.edit.* set syntax=sql
" }}}

" hledger integration {{{
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

"sdvc {{{
let g:sdcv_data_dir = "~/dev/kidneyall/stardict"

if has('win32')
    let s:dict_engine="ecdict"
    let s:tts_cmd='mshta vbscript:Execute("CreateObject(""SAPI.SpVoice"").Speak(""Pronounce: [word]"")(window.close)")'
elseif has('macunix')
    let s:dict_engine="sdcv"
    let s:tts_cmd='say "[word]"'
endif

func! s:buildDictCmd(word) abort
    if s:dict_engine ==? "sdcv"
        let l:cmd = "sdcv -0 -n"
        if g:sdcv_data_dir != ''
            let l:cmd = l:cmd . " -2 " . g:sdcv_data_dir
        endif
        return l:cmd . " \"" . a:word . "\""
    elseif s:dict_engine ==? "ecdict"
        return 'ecdict "' . a:word . '"'
    else
        echoerr "Unknown dictionary engine: " . s:dict_engine
        finish
    endif
endfunc

func! ScratchBuffer(key, direction)
  if (bufexists(a:key))
    let l:lrwin = bufwinnr(a:key)
    if l:lrwin == -1
      if a:direction ==? "v"
        exec "rightbelow vert sb " . bufnr(a:key)
      else
        exec "rightbelow sb " . bufnr(a:key)
      endif
    else
      exec l:lrwin . "wincmd w"
    endif
  else
    if a:direction ==? "v"
      exec "rightbelow vert new " . a:key
    else
      exec "rightbelow new " . a:key
    endif
    setlocal bt=nofile bh=wipe nobl noswf nospell nonu
  endif
endfunc


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
  let l:sdcv_cmd = s:buildDictCmd(a:word)
  exec "norm! :0r !" . l:sdcv_cmd . "\<cr>gg"

  " Remove wav file names
  silent! %s/\S\+\.wav//g

  " Reformat 牛津现代英汉双解词典
  silent! %s/ \* /\r    * /g
  silent! %s/  \d\d\? /\r\r\0/g

  norm! gg
  if s:dict_engine ==? 'sdcv'
    call SdcvFoldDefinition()
    nnoremap zo :call SdcvFoldOpen()<cr>
    norm! gg
    call search("^-->")
    call SdcvFoldOpen()
  endif
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
  if !exists("b:current_syntax") && s:dict_engine ==? 'sdcv'
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
  call system(substitute(s:tts_cmd, '\V[word]', a:word, ''))
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

nnoremap <silent> ,df :call SdcvFoldDefinition()<CR>
nnoremap <silent> ,dn :call SdcvNextBook()<CR>
nnoremap <silent> ,dp :call SdcvPrevBook()<CR>

command! Recite tabnew C:\Users\zhizh\dev\vim-recite
"}}}

"Others {{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>mC :<c-u><c-r><c-r>='command! norm! '. string(getreg(v:register))<cr><c-f><esc>0Ea<space>

""" Capture CLI output in a scratch buffer
command! -nargs=* -complete=shellcmd R :ScratchBuffer('shell.output', 's') | r !<args>
command! -nargs=* -complete=shellcmd RV :ScratchBuffer('shell.output', 'v') | r !<args>

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
command! TAFmtSolrEntity norm! :syn off:setl fdm=manualzE:v/^\s*"entity":/d0dt{$T}D:s/\%(\\\)\@<!\\"/"/ge:s/\\\\\\"/\\"/ge:TAFmtJson

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

""" Convert ps -ef output to Kill -9
command! -range Kill9 <line1>,<line2>:norm! 0vEckill -9ElD0

""" Insert current date at the beginning of a line
command! -range Date <line1>,<line2>:norm! I=strftime('%Y-%m-%d') 

""" Capture CLI output in a scratch buffer
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"}}}

" NeoVim {{{
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

" Neovide {{{
  let g:neovide_cursor_vfx_mode = "railgun"
  "let g:neovide_cursor_vfx_mode = "pixiedust"
  "let g:neovide_cursor_vfx_mode = "sonicboom"
  let g:neovide_cursor_trail_length=0.8
"" }}}

"Font {{{
let g:guifontname = 'Cascadia\ Code,Sarasa\ Mono\ J'
let s:default_guifontheight = 18
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
nnoremap <M-=> :call FunChangeFontSize(1)<CR>
nnoremap <M--> :call FunChangeFontSize(-1)<CR>
nnoremap <M-0> :call FunChangeFontSize()<CR>
"}}}

nohl

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}
