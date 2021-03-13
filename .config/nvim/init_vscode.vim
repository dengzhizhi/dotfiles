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
Plug 'https://github.com/ledger/vim-ledger.git'
Plug 'simnalamburt/vim-mundo'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'gaving/vim-textobj-argument'

call plug#end()
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
set spell
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

nnoremap ,u :MundoShow<CR>

nnoremap ,U gUiwe
inoremap ,U <ESC>gUiwgi

nnoremap ,y "+
vnoremap ,y "+

nnoremap ,, ,
vnoremap ,, ,

" }}}

"########## Insert mode j Combinations ##########" {{{
inoremap jk <ESC>
inoremap jl <Right>
inoremap jh <Left>
" }}}

"########## Insert Mode Shortcuts ########## {{{
inoremap <M-h> <ESC>i
inoremap <M-l> <ESC>la
"}}}

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
 
" ######## EasyMotion ######## {{{
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)
map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>s <Plug>(easymotion-s)
map <Leader>S <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t)

map  <Leader>f <Plug>(easymotion-bd-f)
" s{char}{char} to move to {char}{char}
" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>v V<Plug>(easymotion-bd-jk)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
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

"Mundo {{{
set undofile
set undodir=~/.vim/undo
"}}}

"Others {{{
command! Capitalize :s/\C\<[a-z]\+/\L\u\0/g|:nohl

nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>mC :<c-u><c-r><c-r>='command! norm! '. string(getreg(v:register))<cr><c-f><esc>0Ea<space>

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

"}}}

nohl

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}
