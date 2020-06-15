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
Plug 'https://github.com/Yggdroot/LeaderF.git'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'https://github.com/mkarmona/colorsbox.git'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rhysd/vim-grammarous'  " Grammar check
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'https://github.com/ledger/vim-ledger.git'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'rbgrouleff/bclose.vim'  " Needed by ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }
Plug 'simnalamburt/vim-mundo'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/wellle/targets.vim.git'
Plug 'gaving/vim-textobj-argument'
"Plug 'lifepillar/vim-cheat40'
Plug 'xavierchow/vim-swagger-preview'
Plug 'sophacles/vim-processing'

"Plug 'https://github.com/AndrewRadev/sideways.vim.git'
"Plug 'https://github.com/airblade/vim-rooter.git'

"Plug 'https://github.com/vim-scripts/SyntaxRange.git'
"Plug 'https://github.com/chrisbra/csv.vim.git'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh', 'branch': 'release'}
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

"Colorschemes
colo atom

"########## Developer Settings ########## {{{
set termguicolors
set guifont=Iosevka:h12
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
 
" ######### Chagne Font Size ########## {{{
function! FunChangeFontSize()
    let l:s = input("FontSize: ")
    execute "set guifont=Iosevka:h".l:s
endfunction

command! ChangeFontSize call FunChangeFontSize()
" }}}

" ######## Enhanced Diff ######## {{{
autocmd VimEnter * EnhancedDiff histogram
" }}}

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

" Fix tmux clipboard in Mac {{{
" set clipboard=unnamed
" }}}

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Color {{{
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


" Coc.Vim {{{
"let g:rbpt_max = 16
"let g:deoplete#enable_at_startup = 1

" if hidden is not set, TextEdit might fail.
"set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300

" don't give |ins-completion-menu| messages.
"set shortmess+=c

" always show signcolumns
"set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <S-TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"" xmap <leader>f  <Plug>(coc-format-selected)
"" nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}

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
