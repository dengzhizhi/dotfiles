"========== Navigation in the location and quickfix list =========={{{
nnoremap <silent> [l :<C-U>lprevious<CR>zv
nnoremap <silent> ]l :<C-U>lnext<CR>zv
nnoremap <silent> [L :<C-U>lfirst<CR>zv
nnoremap <silent> ]L :<C-U>llast<CR>zv
nnoremap <silent> [q :<C-U>cprevious<CR>zv
nnoremap <silent> ]q :<C-U>cnext<CR>zv
nnoremap <silent> [Q :<C-U>cfirst<CR>zv
nnoremap <silent> ]Q :<C-U>clast<CR>zv
"}}}

" Close location list or quickfix list if they are present,
" see https://superuser.com/q/355325/736190
" nnoremap<silent> \x :<C-U>windo lclose <bar> cclose<CR>

" Close a buffer and switching to another buffer, do not close the
" window, see https://stackoverflow.com/q/4465095/6064933
" nnoremap <silent> \d :<C-U>bprevious <bar> bdelete #<CR>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
" nnoremap <expr> <Space>o printf('m`%so<ESC>``', v:count1)
" nnoremap <expr> <Space>O printf('m`%sO<ESC>``', v:count1)

" Insert a space after current character
" nnoremap <Space><Space> a<Space><ESC>h

" Move the cursor based on physical lines, not the actual lines.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> gj j
noremap <silent> gk k
noremap <silent> gh _
noremap <silent> gl g_

" bulk move up and down
noremap <silent> <c-j> 5j
noremap <silent> <c-j> 5j
noremap <silent> <c-k> 5k
noremap <silent> <c-k> 5k

" nnoremap ^ g^
" nnoremap 0 g0

" Do not include white space characters when using $ in visual mode,
" see https://vi.stackexchange.com/q/12607/15292
" xnoremap $ g_

" Jump to matching pairs easily in normal mode
" nnoremap <Tab> %

" Go to start or end of line easier
" nnoremap H ^
" xnoremap H ^
" nnoremap L g_
" xnoremap L g_

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
" xnoremap < <gv
" xnoremap > >gv

" When completion menu is shown, use <cr> to select an item and do not add an
" annoying newline. Otherwise, <enter> is what it is. For more info , see
" https://superuser.com/a/941082/736190 and
" https://unix.stackexchange.com/q/162528/221410
" inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
" Use <esc> to close auto-completion menu
" inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
" inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Edit and reload init.vim quickly
nnoremap <silent> ,c :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> ,C :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
      \ call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

" Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
nnoremap <silent> <expr> <leader>v printf('`[%s`]', getregtype()[0])

" Search in selected region
xnoremap g/ :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

" Find and replace (like Sublime Text 3)
nnoremap <C-H><C-H> :%s/
xnoremap <C-H><C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>

" Use Esc to quit builtin terminal
" tnoremap <ESC>   <C-\><C-n>

" Toggle spell checking (autosave does not play well with z=, so we disable it
" when we are doing spell checking)
nnoremap <silent> <F11> :<C-U>set spell! spell?<cr>
inoremap <silent> <F11> <C-O>:<C-U>set spell! spell?<cr>

" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
" nnoremap c "_c
" nnoremap C "_C
" nnoremap cc "_cc
" xnoremap c "_c

" Remove trailing whitespace characters
nnoremap <silent> <leader><Space> :<C-U>StripTrailingWhitespace<CR>

" check the syntax group of current cursor position
nnoremap <silent> <leader>st :<C-U>call utils#SynGroup()<CR>

" Copy entire buffer.
nnoremap <silent> <leader>y :<C-U>%y<CR>

" Toggle cursor column
nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>

" Move current line up and down
" nnoremap <silent> <A-k> <Cmd>call utils#SwitchLine(line('.'), 'up')<CR>
" nnoremap <silent> <A-j> <Cmd>call utils#SwitchLine(line('.'), 'down')<CR>

" Replace visual selection with text in register, but not contaminate the
" register, see also https://stackoverflow.com/q/10723700/6064933.
" xnoremap p "_c<ESC>p

" nnoremap <silent> gb :<C-U>call buf_utils#GoToBuffer(v:count, 'forward')<CR>
" nnoremap <silent> gB :<C-U>call buf_utils#GoToBuffer(v:count, 'backward')<CR>

" nnoremap <Left> <C-W>h
" nnoremap <Right> <C-W>l
" nnoremap <Up> <C-W>k
" nnoremap <Down> <C-W>j

" Text objects for URL
xnoremap <silent> iu :<C-U>call text_obj#URL()<CR>
onoremap <silent> iu :<C-U>call text_obj#URL()<CR>

" Text objects for entire buffer
xnoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>
onoremap <silent> iB :<C-U>call text_obj#Buffer()<CR>

" Do not move my cursor when joining lines.
nnoremap <silent> J mzJ`z
nnoremap <silent> gJ mzgJ`z

" Break inserted text into smaller undo units.
for ch in ['.', '!', '?', ';', ':', '=']
  execute printf('inoremap %s %s<C-g>u', ch, ch)
endfor

" insert semicolon in the end
inoremap <silent> <A-;> <ESC>mzA;<ESC>`zi
inoremap <silent> <A-,> <ESC>mzA,<ESC>`zi

" Keep cursor position after yanking
" nnoremap y myy
" xnoremap y myy
"
" augroup restore_after_yank
"   autocmd!
"   autocmd TextYankPost *  call s:restore_cursor()
" augroup END
"
" function! s:restore_cursor() abort
"   silent! normal `y
"   silent! delmarks y
" endfunction

" Toggle modifiable for current buffer
nnoremap <silent> <space>s<space> :setl ma! ma?<cr>
nnoremap <silent> ;m :setl ma! ma?<cr>

" Toggle transient nowrite (scrath) for current buffer, the buffer
" will be deleted when it hides
nnoremap <silent> <space>scc<space> :if &bt=="nofile" \| setl bh= bt= \| echo 'Current buftype is now cleared' \| else \| setl bh=delete bt=nofile noswapfile \| echo 'Set current buffer to scracth' \| endif<CR>

" Toggle nowrite (scrath) for current buffer, the buffer will stay
" longer even when it hides
nnoremap <silent> <space>sc<space> :if &bt=="nofile" \| setl bt= \| echo 'Current buftype is now cleared' \| else \| setl bt=nofile noswapfile \| echo 'Set current buffer to scracth' \| endif<CR>

" Sync syntax highlighting (to remove some highlighting quirk)
:noremap <silent> <space>ss<space> :silent noh <Bar>echo<cr>:syn sync fromstart<cr>

" Toggle wrap
:nnoremap <silent> <space>w<space> <CMD>setl wrap! wrap?<cr>

" Toggle always center cursor
:nnoremap <silent> <space>o<space> :let &l:so=&l:so>500?5:501<cr>:let &l:siso=&l:siso>500?5:501<cr>:<c-r>=&l:so>500?"let &l:ve='all' <bar> norm zzgm":"let &l:ve='block'"<cr><cr>

" Toggle relative linenumbers
:nnoremap <silent> <space>rr<space> <CMD>setl relativenumber! relativenumber?<cr>

" Toggle cursor column
:nnoremap <silent> <space>cc<space> <CMD>set cursorcolumn! cursorcolumn?<CR>

" Toggle virtual edit
:nnoremap <silent> <space>ve<space> :let &l:ve=&l:ve=='all'?'block':'all'<cr><bar>:echo 'Virtual Edit: ' . &l:ve<cr>

" neovim only
if has('nvim')
  set inccommand=split
endif

" Swap gf and gF
nnoremap <silent> gf gF
nnoremap <silent> gF gf

" Perform a no-op replacement and extract the matches of the last search into variable t, use `:put=t` to
" insert extractions into text.
nnoremap <silent> <space>ev<space> :<c-u>let t = []<cr>:%s//\=add(t, submatch(0))[-1]/g<cr>:echo "Use :put=t to insert extracted matches"<cr>
xnoremap <silent> <space>ev<space> :<c-u>let t = []<cr>:<c-u>'<,'>s//\=add(t, submatch(0))[-1]/g<cr>:echo "Use :put=t to insert extracted matches"<cr>


"########## Kitty Modifier Shortcuts ##########{{{
noremap  <silent> <A-h> _
inoremap <silent> <A-h> <ESC>I
noremap  <silent> <A-l> g_
inoremap <silent> <A-l> <ESC>A
nnoremap <silent> <A-c> "+yy
xnoremap <silent> <A-c> "+y
cnoremap <silent> <A-v> <C-R>+
inoremap <silent> <A-v> <C-R>+
nnoremap <silent> <A-v> "+p
xnoremap <silent> <A-v> "+p
noremap  <silent> <A-a> mjggVG
inoremap <silent> <D-;> <ESC>mzA;<ESC>`za
" Move current visual-line selection up and down
xnoremap <silent> <A-k> :<C-U>call utils#MoveSelection('up')<CR>
xnoremap <silent> <A-j> :<C-U>call utils#MoveSelection('down')<CR>

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd+=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.ts,.tsx

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
"}}}


"########## Comma Combinations ##########" {{{
inoremap ,. <ESC>
inoremap ,,. ,<ESC>
xnoremap ,. <ESC>
lnoremap ,. <ESC>
nnoremap ,. <ESC>
cnoremap ,. <ESC>
onoremap ,. <ESC>
tnoremap ,. <C-\><C-N>

nnoremap ,, ,
vnoremap ,, ,

nnoremap ,k "
vnoremap ,k "

vnoremap ,x <ESC>`.``gvp``P
nnoremap ,x viw<ESC>`.``gvp``P

nnoremap ,tt :e <C-R>=printf("%s/ticket.vim", stdpath("config"))<CR><CR><C-L>:setl noma bh=delete<cr>
nnoremap ,tq :e <C-R>=printf("%s/saved_macros.vim", stdpath("config"))<CR><CR><C-L>:setl noma<cr>
nnoremap ,tc :e <C-R>=printf("%s/core/commands.vim", stdpath("config"))<CR><CR><C-L>
nnoremap ,tk :e <C-R>=printf("%s/core/mappings.vim", stdpath("config"))<CR><CR><C-L>
nnoremap ,tp :e <C-R>=printf("%s/lua/plugins.lua", stdpath("config"))<CR><CR><C-L>
nnoremap ,tN :e <c-r>=printf("%s/lua/config/vim-navigator.lua", stdpath("config"))<cr><cr><c-l>

nnoremap ,tff :sp <C-R>=printf("%s/preset-commands.vim", stdpath("config"))<CR><CR><C-L>:setl bh=delete noswf noma<cr>
nnoremap ,tfs :e <C-R>=printf("%s/script_scratch.vim", stdpath("config"))<CR><CR><C-L>:setl bh=delete noswf<cr>
nnoremap ,tfl :e <C-R>=printf("%s/script_scratch.lua", stdpath("config"))<CR><CR><C-L>:setl bh=delete noswf<cr>
nnoremap ,tb :sp <C-R>=printf("%s/bookmarks.md", stdpath("config"))<CR><CR><C-L>:setl bh=delete noswf noma<cr>
nnoremap ,tn :sp <C-R>=printf("%s/quicknotes.md", stdpath("config"))<CR><CR><C-L>:setl bh=delete noswf noma<cr>

nnoremap ,ts :e ~/dev/zhizhi/workjournal/obsidian/Pages/Vim/Vim Plugin Shortcuts.md<CR><C-L>:setl bh=delete noswf noma<cr>

"Open the current vim help file in a proper help buffer
nnoremap ,th :help <c-r>=expand('%:t')<cr> \| <c-r>=line('.')<cr><cr><c-w>o

nnoremap ,U :MundoShow<CR>

nnoremap ,u mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<cr>
inoremap ,u <ESC>mpgUiW"pciW<C-R>=substitute(@p,'-','_','ge')<CR><ESC>`p:delm p<CR>a

nnoremap ,y "+
xnoremap ,y "+
nnoremap ,y- "1p
xnoremap ,y- "1p
nnoremap ,y_ "-p
xnoremap ,y_ "-p
nnoremap ,p "0p
xnoremap ,p "0p
nnoremap ,P "0P
xnoremap ,P "0P

inoremap ,p <c-r>0
cnoremap ,p <c-r>0
tnoremap ,p <c-\><c-n>"0pi
inoremap ,yp <c-r>+
cnoremap ,yp <c-r>+
tnoremap ,yp <c-\><c-n>"+pi
inoremap ,y- <c-r>1
tnoremap ,y- <c-\><c-n>"1pi
inoremap ,y_ <c-r>-
tnoremap ,y_ <c-\><c-n>"-pi

nnoremap ,y0 <CMD>let @+=@0<CR><CMD>echo "Register 0 copied to system clipboard"<CR>
nnoremap ;y  <CMD>let @+=@0<CR><CMD>echo "Register 0 copied to system clipboard"<CR>
nnoremap ,y9 <CMD>let @0=@+<CR><CMD>echo "system clipboard copied to Register 0"<CR>

"convert register mode in the default yank register (@0)
nnoremap <silent> yl :call setreg('0', @0, 'l')<CR>
nnoremap <silent> yc :call setreg('0', substitute(@0, '\n$', '', ''), 'c')<CR>

nnoremap ,n :norm<space>
vnoremap ,n :norm<space>

inoremap ,m <esc>A<cr>
nnoremap ,m A<cr>
inoremap ,M <esc>01kA<cr>
nnoremap ,M 01kA<cr>

inoremap ,f <C-R>=expand("%:")<left><left>
cnoremap ,f <C-R>=expand("%:")<left><left>
abbrev ,c <C-R>=getcwd()<cr>
abbrev muid <C-R>=substitute(system('uuidgen'), '\n\+$', '', '')<cr>
abbrev mdate <C-R>=substitute(system('date'), '\n\+$', '', '')<cr>

cnoremap ,w <C-R><C-W>
cnoremap ,W <C-R>=expand("<cWORD>")<cr>

xnoremap ,e g_
xnoremap ,E <ESC>_vg_
nnoremap ,E _vg_
" }}}

"########## Semicolon Combinations ##########" {{{
nnoremap <space>; :
xnoremap <space>; :
nnoremap g<space>; :%
xnoremap g<space>; :<c-u>%

nnoremap ;; ;
xnoremap ;; ;

nnoremap ;j <cmd>HopWord<cr>
xnoremap ;j <cmd>HopWord<cr>
onoremap ;j <cmd>HopWord<cr>

nnoremap ;k <cmd>lua require('hop').hint_patterns({}, '.....')<cr>
xnoremap ;k <cmd>lua require('hop').hint_patterns({}, '.....')<cr>
onoremap ;k <cmd>lua require('hop').hint_patterns({}, '.....')<cr>

nnoremap ;h <cmd>HopChar2<cr>
xnoremap ;h <cmd>HopChar2<cr>
onoremap ;h <cmd>HopChar2<cr>

nnoremap ;l <cmd>HopLine<cr>
xnoremap ;l <cmd>HopLine<cr>
onoremap ;l <cmd>HopLine<cr>

nnoremap ;s <cmd>BufferLineCyclePrev<cr>
vnoremap ;s <cmd>BufferLineCyclePrev<cr>
nnoremap ;f <cmd>BufferLineCycleNext<cr>
vnoremap ;f <cmd>BufferLineCycleNext<cr>


function! ZdSmartQuit(force)
  let cmd = "bdelete"
  let listed_buf_count = len(getbufinfo({'buflisted': 1}))
  let listed_win_count = len(filter(range(1, winnr('$')), 'buflisted(winbufnr(v:val))'))
  let filtered_tab = exists('t:bufferline_tab_filter_enabled') && t:bufferline_tab_filter_enabled
  " if &filetype == 'toggleterm' || !buflisted(bufnr())
  if &filetype == 'minifiles'
    exec 'lua MiniFiles.close()'
    return
  endif
  if !buflisted(bufnr())
    if winnr('$') > 1 || tabpagenr('$') > 1
      " Usually unlisted buffer is managed by plugin and better keep it
      " for reopen
      let cmd = "hide"
    elseif listed_buf_count > 0
      " The last window can't be hide, just move to a listed buffer
      let cmd = 'bprev'
    endif
  elseif listed_win_count > 1 || (tabpagenr('$') > 1 && filtered_tab)
    " For split window or tabpage, we just close the window
    " and keep the buffer because it maybe duplicated in split window
    " or tabpage intentionally
    let cmd = "close"
  endif
  if a:force && cmd == "bdelete"
    let cmd = cmd . '!'
  endif
  echo "Closing buffer or window with: [" . cmd . "]"
  if buflisted(bufnr())
    if cmd[0:6] ==# "bdelete" && listed_buf_count > 1
      bprev
      exec cmd . " #"
      bnext
    elseif filtered_tab && listed_win_count == 1
      " Bufferline keymap to exclude current buffer and move to a
      " previous buffer
      norm ;wd;s
    else
      exec cmd
    endif
  else
    exec cmd
  endif
endfunction

" Can't use `hide` in command window
nnoremap <silent> ;q :call ZdSmartQuit(0)<cr>
xnoremap <silent> ;q :<c-u>call ZdSmartQuit(0)<cr>
tnoremap <silent> ;q <C-\><C-N>:<c-u>call ZdSmartQuit(0)<cr>
nnoremap <silent> ;Q :call ZdSmartQuit(1)<cr>
xnoremap <silent> ;Q :<c-u>call ZdSmartQuit(1)<cr>

noremap <silent> ;wq :bp\|silent! bd#\|bn<cr>
noremap <silent> ;wQ <CMD>tabclose<CR>

" Markdown formats
xnoremap <silent> ;ei <ESC>`>a <ESC>gvdi__<ESC>Pllxhh
nnoremap <silent> ;ei viw<ESC>`>a <ESC>gvdi__<ESC>Pllxhh
xnoremap <silent> ;eb <ESC>`>a <ESC>gvdi****<ESC>hPlllxhhh
nnoremap <silent> ;eb viw<ESC>`>a <ESC>gvdi****<ESC>hPlllxhhh
xnoremap <silent> ;el <ESC>`>a <ESC>gv"pdi[]<ESC>"pPla()<ESC>"+Pf)lx
xnoremap <silent> ;eL <ESC>`>a <ESC>gv"pdi[]()<ESC>"pPllxF]i
nnoremap <silent> ;em I<BAR><ESC>A<BAR><CR><BAR>:--:<BAR><CR><BAR>* *<BAR><ESC>hhi<SPACE>
xnoremap <silent> ;ec :g/^$/d<CR>:nohl<CR>
"}}}

"########## Auto Filling Vertical Split Windows ##########" {{{
let g:collapsed_vertical_window_size = 20

function! ResizeAutoFillingVerticalWindowWidths()
  let l:win_count = winnr('$')
  let l:fill_width = &columns - g:collapsed_vertical_window_size * (l:win_count - 1)
  " Iterate through each window except the last one
  for l:winNr in range(1, l:win_count)
    " Build and execute the command to resize the window's width
    if l:winNr == winnr()
      execute "vert " . l:winNr . "resize " . l:fill_width
    else
      execute "vert " . l:winNr . "resize " . g:collapsed_vertical_window_size
    endif
  endfor
endfunction

function! FilledWindowMove(direction)
  let l:current_winnr = winnr()
  let l:target_winnr = l:current_winnr + a:direction
  execute l:target_winnr . "wincmd x"
  execute l:target_winnr . "wincmd w"
endfunction

function! ClossAutoFilledWindowToRight()
  let l:current_winnr = winnr()
  let l:win_count = winnr('$')
  let l:p = l:win_count
  while l:p > l:current_winnr
    silent! execute l:p . "wincmd c"
    let l:p = l:p - 1
  endwhile
  call ResizeAutoFillingVerticalWindowWidths()
  norm mp0`p
  delm p
endfunction

noremap <silent> ;vv :set nowrap<CR>zz<c-w>v:call ResizeAutoFillingVerticalWindowWidths()<CR>
noremap <silent> ;vm :call ResizeAutoFillingVerticalWindowWidths()<CR>
noremap <silent> ;vq :tabclose<CR>
noremap <silent> <space>tq<space> :tabclose<CR>
noremap <silent> ;vt :tab sp<CR>
noremap <silent> <space>tt<space> :tab sp<CR>
nmap <silent> ;vd ;vvgdzz
nmap <silent> ;vf ;vvgfzz
xmap <silent> ;vf <ESC>;vvgvgfzz
nmap <silent> ;vc ;q;vmmp0`p:delm p<CR>
nmap <silent> ;vr :call ClossAutoFilledWindowToRight()<CR>
"}}}



"########## Insert mode j Combinations ##########" {{{
" supported by jdhao/better-escape.vim
" inoremap jk <ESC>
" inoremap jl <Right>
" inoremap jh <Left>
" }}}

"########## Folds ##########{{{
"-- Fold by keyword
" Fold by the last search keyword
nnoremap <Leader>z/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
" Fold by the current word or selection
vnoremap <Leader>z* "sy:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
nnoremap <Leader>z* "syiw:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"Fold except selection
vnoremap <Leader>zv <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<

" Fold level +1 for the whole buffer
nnoremap <silent> <Space>ddj<Space> :let &foldlevel=&foldlevel+1<cr>:set foldlevel?<cr>
" Fold level -1 for the whole buffer
nnoremap <silent> <Space>ddk<Space> :let &foldlevel=&foldlevel-1<cr>:set foldlevel?<cr>
" Fold to the current level for the whole buffer
nnoremap <silent> <Space>ddl<Space> :let &foldlevel=foldlevel('.')<cr>:set foldlevel?<cr>

" Collapse everthing except the path to current cursor
nnoremap <silent> <Space>ddu<Space> zMzv

" Collapse everything except the current method
" nnoremap <silent> <Space>ddm<Space> mpzMzvj[mzczO`p:delm p<cr>
nmap <silent> <Space>ddm<Space> mpzMzvj[mzczO`p:delm p<cr>

" Fold by the last search keyword
nnoremap <silent> <Space>ddi<Space> :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
" Fold by the current word or selection
vnoremap <silent> <Space>ddii<Space> "sy:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
nnoremap <silent> <Space>ddii<Space> "syiw:setlocal foldexpr=(getline(v:lnum)=~@s)?0:(getline(v:lnum-1)=~@s)\\|\\|(getline(v:lnum+1)=~@s)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

" Fold except selection
vnoremap <silent> <Space>ddo<Space> <Esc>:set foldmethod=manual<CR>zE`<kzfgg`>jzfG`<

" Enable syntax folding and collapse everthing except the path to current cursor
nnoremap <silent> <Space>dd;<Space> :syntax on<cr>:set fdm=syntax<cr>zMzvzz

" back to treesitter folding
nnoremap <silent> <Space>ddt<Space> :setl foldmethod=expr<cr>:setl foldexpr=nvim_treesitter#foldexpr()<cr>

" Fold vim help file
nmap <silent> <Space>ddh<Space> m`/^\S\+\.txt\\|^\|\\|^<\\| \~$\\|\*.\+\*$<cr><space>ddi<space>:nohl<cr>``zMzv
"}}}

"########## Tab Enhancement ##########{{{
nnoremap <silent> <space>t<space> g<tab>
nnoremap <silent> <c-tab> g<tab>
nnoremap <silent> <space>e<space> :tab sp<cr>

nnoremap <expr> <space>ttn<space> winnr('$') == 1 ?  '<CMD>new<cr><C-W>o' : '<CMD>tabnew<CR>'
nnoremap <space>tts<space> :tab sp<cr>
nnoremap ZT :tabo<cr>
nnoremap <silent> ZW :BufCurOnly<cr><C-L>

"Open scratch buffers
nnoremap <silent> <space>ttst<space> :tabnew<cr>:setl bt=nofile bh=wipe nobl noswf<cr>
nnoremap <silent> <space>ttss<space> :new<cr>:setl bt=nofile bh=wipe nobl noswf<cr>
nnoremap <silent> <space>ttsv<space> :vnew<cr>:setl bt=nofile bh=wipe nobl noswf<cr>
"}}}

" ########## Hybrid Key Mapping ##########{{{
inoremap <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
cnoremap        <C-B> <Left>
inoremap <expr> <C-F> col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
inoremap <expr> <C-D> col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"
inoremap        <C-A> <C-O>^
cnoremap        <C-A> <Home>

inoremap <D-f> <esc>ea
inoremap <D-b> <esc>bi

" stole from https://github.com/tpope/vim-rsi/blob/master/plugin/rsi.vim
function! s:transpose() abort
  let pos = getcmdpos()
  if getcmdtype() =~# '[?/]'
    return "\<C-T>"
  elseif pos > strlen(getcmdline())
    let pre = "\<Left>"
    let pos -= 1
  elseif pos <= 1
    let pre = "\<Right>"
    let pos += 1
  else
    let pre = ""
  endif
  return pre . "\<BS>\<Right>".matchstr(getcmdline()[0 : pos-2], '.$')
endfunction

cnoremap <expr> <C-T> <SID>transpose()

function! s:ctrl_u()
  if getcmdpos() > 1
    let @- = getcmdline()[:getcmdpos()-2]
  endif
  return "\<C-U>"
endfunction

cnoremap <expr> <C-U> <SID>ctrl_u()
cnoremap <expr> <C-Y> pumvisible() ? "\<C-Y>" : "\<C-R>-"
" }}}

"########## Remap CTRL_W to TAB ######### {{{
nnoremap <expr> <TAB>m exists(':WindowsMaximize') ? '<cmd>WindowsMaximize<cr>' : '<c-w>\|<c-w>_'
nnoremap <expr> <c-w>m exists(':WindowsMaximize') ? '<cmd>WindowsMaximize<cr>' : '<c-w>\|<c-w>_'

nnoremap <TAB>+ <C-W>+
nnoremap <TAB>- <C-W>-
nnoremap <TAB>< <C-W><
nnoremap <expr> <TAB>= exists(':WindowsEqualize') ? '<cmd>WindowsEqualize<cr>' : '<C-W>='
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
nnoremap <expr> <TAB>_ exists(':WindowsMaximizeVertically') ? '<cmd>WindowsMaximizeVertically<cr>' : '<C-W>_'
nnoremap <TAB>b <C-W>b
nnoremap <TAB>c <C-W>c
nnoremap <TAB>d <C-W>d
nnoremap <TAB>g<C-]> <C-W>g<C-]>
nnoremap <TAB>g<Bar> <C-W>g<Bar>
nnoremap <TAB>g} <C-W>g}
nnoremap <TAB>gf <C-W>gF
nnoremap <TAB>gF <C-W>gf
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
nnoremap <expr> <TAB><Bar> exists(':WindowsMaximizeHorizontally') ? '<cmd>WindowsMaximizeHorizontally<cr>' : '<C-W><Bar>'
nnoremap <TAB>} <C-W>}
nnoremap <TAB><Down> <C-W><Down>
nnoremap <TAB><Up> <C-W><Up>
nnoremap <TAB><Left> <C-W><Left>
nnoremap <TAB><Right> <C-W><Right>
nnoremap <TAB>a <cmd>WindowsToggleAutowidth<cr>

nnoremap <TAB>i <C-I>
nnoremap <c-w>i <C-I>

" Previous buffer
nnoremap <silent> <tab>f <C-6>
inoremap <silent> <tab>f <ESC><C-6>

" }}}

" ########## Convenient yanks ##########{{{
"
"Yank a line without line break
nnoremap <silent> yuu mp_yg_`p:delm p<cr>
"Copy a line without line break to clipboard
nnoremap <silent> yul mp_"+yg_`p:delm p<cr>
"Copy a block to clipboard
nnoremap <silent> yup mp"+yip`p:delm p<cr>
"Copy a code block in markdown file to clipboard
nnoremap <silent> yuc mp?^\s*```<cr>1jV/^\s*```<cr>1k"+y`p:nohl<cr>:delm p<cr>
"Copy buffer to clipboard
nnoremap <silent> yua :%y+<cr>
"Copy buffer to default register
nnoremap <silent> yus :%y"<cr>
"Copy contant between bracket to clipboard (need targets.vim plugin)
nnoremap <silent> yuB mpyib`p:delm p<cr>

"Paste clipboard content in a new scratch buffer
nnoremap <silent> yui :tabnew<cr>:0put *<cr>:setl bh=delete bt=nowrite<cr>gg0:$g/^$/d<cr>:nohl<cr>
"Copy buffer content to clipboard and attempt to close it
nnoremap <silent> yuy :%y+<cr>:tabclose<cr>
"Copy file path
nnoremap <silent> <space>cpp<space> :let @*=expand("%:p")<cr>:echo '-= File path copied=-'<cr>
"Copy file name
nnoremap <silent> <space>cpf<space> :let @*=expand("%:t")<cr>:echo '-= File name copied=-'<cr>
"Copy bookmark position reference
nnoremap <silent> <space>cpb<space> :let @*='📝 '.expand("%:p").':'.line(".").':'.col(".")<cr>:echo '-= Cursor bookmark copied=-'<cr>
nnoremap <silent> <space>cpbb<space> mp_"py50l:let @*='(`'.@p.'`)'.' 📝 '.expand("%:p").':'.line(".").':'.col(".").' ['.system('git log -n 1 --pretty=format:%h -- '.expand('%:p')).']'<cr>`p:echo '-= Cursor bookmark copied=-'<cr>

nnoremap <silent> <space>cpgw<space> :<c-r>=printf("AsyncRun -silent codelink.clj -f '%s' -l %d -c", expand("%:p"), line("."))<cr><cr>:echo '-= Web link with revision copied =-'<cr>
vnoremap <silent> <space>cpgw<space> :<c-u><c-r>=printf("AsyncRun -silent codelink.clj -f '%s' -l %d -e %d -c", expand("%:p"), line("'<"), line("'>"))<cr><cr>:echo '-= Web link with revision copied =-'<cr>

nnoremap <silent> <space>cpow<space> :<c-r>=printf("AsyncRun -silent codelink.clj -f '%s' -l %d -o", expand("%:p"), line("."))<cr><cr>:echo '-= Opening web link in browser =-'<cr>
vnoremap <silent> <space>cpow<space> :<c-u><c-r>=printf("AsyncRun -silent codelink.clj -f '%s' -l %d -e %d -o", expand("%:p"), line("'<"), line("'>"))<cr><cr>:echo '-= Opening web link in browser =-'<cr>

"Gui paste from clipboard
nnoremap <silent> <D-v> "*p
inoremap <silent> <D-v> <c-r>*
nnoremap <silent> <M-v> "*p
inoremap <silent> <M-v> <c-r>*
" Option-c
xnoremap <silent> ç "+y
nmap <silent> ç "+Y
" Option-v
nnoremap <silent> √ "+p
xnoremap <silent> √ "+p
inoremap <silent> √ <c-r>+
cnoremap <silent> √ <c-r>+

" Move previous selection to current position
nnoremap <silent> <space>mv<space> mp:'<,'>t.<cr>:'<,'>d<cr>`p

" Paste as relative path

" Paste the absolute path in systemclipboard as relative path to the
" current file
function! InsertRelativePathFromClipboard()
  " Get the absolute path from the clipboard
  let clipboardPath = getreg('+')

  " Get the absolute path of the current buffer's file
  let currentBufferPath = expand('%:p')

  " Split the paths into components
  let clipboardPathComponents = split(clipboardPath, '/')
  let currentBufferPathComponents = split(currentBufferPath, '/')

  " Find the common prefix
  let commonPrefixLength = 0
  while commonPrefixLength < len(clipboardPathComponents) &&
        \ commonPrefixLength < len(currentBufferPathComponents) &&
        \ clipboardPathComponents[commonPrefixLength] ==# currentBufferPathComponents[commonPrefixLength]
    let commonPrefixLength += 1
  endwhile

  " Calculate the relative path
  let upDirs = len(currentBufferPathComponents) - commonPrefixLength - 1
  let downDirs = clipboardPathComponents[commonPrefixLength:]
  let relativePath = repeat('../', upDirs) . join(downDirs, '/')

  " Insert the relative path at the cursor position
  execute 'normal! i' . relativePath
endfunction

nnoremap <leader>rp :call InsertRelativePathFromClipboard()<cr>
inoremap <leader>rp <space><C-o>:call InsertRelativePathFromClipboard()<cr><right><del>
"}}}

"########## Macro Related ##########{{{
nnoremap <leader>mm :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
nnoremap <leader>mC :<c-u><c-r><c-r>='command! let @n='. string(getreg(v:register))<cr> <bar> norm! @n<c-f><esc>0Ea<space>
"}}}

"########## Font ##########{{{
let g:guifontname = 'RecMonoCasual\ Nerd\ Font\ Mono'
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
nnoremap <silent> <C-=> :call FunChangeFontSize(1)<CR>
nnoremap <silent> <C--> :call FunChangeFontSize(-1)<CR>
nnoremap <silent> <M-0> :call FunChangeFontSize()<CR>
" Option-=
nnoremap <silent> ≠ :call FunChangeFontSize(1)<CR>
" Option--
nnoremap <silent> – :call FunChangeFontSize(-1)<CR>
" Option-0
nnoremap <silent> º :call FunChangeFontSize()<CR>
"}}}

"########## Capture CLI output in a scratch buffer ##########{{{
command! -nargs=* -complete=shellcmd R :call ScratchBuffer('shell.output', 's') | r !<args>
command! -nargs=* -complete=shellcmd RV :call ScratchBuffer('shell.output', 'v') | r !<args>

command! -range ExecVimL call execute(substitute(join(getline(<line1>, <line2>), " \n "), '\n\s*\\', ' ', 'g'), '')
command! -range ExecVimL1 let a = join(getline(<line1>, <line2>), " \n ")
command! -range ExecLua call execute('lua ' . join(getline(<line1>, <line2>), " \n "), '')
nnoremap <silent> <space>r<space> :ExecVimL<cr>:<c-u>echo "Current line executld"<cr>
xnoremap <silent> <space>r<space> :ExecVimL<cr>:<c-u>echo "Selected range executed"<cr>
nnoremap <silent> <space>rl<space> :ExecLua<cr>:<c-u>echo "Current line executed"<cr>
xnoremap <silent> <space>rl<space> :ExecLua<cr>:<c-u>echo "Selected range executed"<cr>
nnoremap <silent> <expr> ,r ((&ft=='lua' ? ':ExecLua' : ':ExecVimL') . '<cr>:<c-u>echo "Current line executed"<cr>')
xnoremap <silent> <expr> ,r ((&ft=='lua' ? ':ExecLua' : ':ExecVimL') . '<cr>:<c-u>echo "Selected range executed"<cr>')
"}}}

"########## External filters ##########{{{
"encode/decode url
nnoremap <silent> <space>decu<space> :.!python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(input()))"<cr>
vnoremap <silent> <space>decu<space> :!python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(input()))"<cr>
nnoremap <silent> <space>encu<space> :.!python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(input()))"<cr>
vnoremap <silent> <space>encu<space> :!python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(input()))"<cr>

function! Url_decode(str)
  return substitute(substitute(a:str, '%\(\x\{2}\)', '\=nr2char("0x" . submatch(1))', 'g'), '+', ' ', 'g')
endfunction

function! Url_encode(str)
  return substitute(substitute(a:str, ' ', '+', 'g'), '[^a-zA-Z0-9._+~-]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
endfunction

command! DecodeUrl :let url_line = line('.')<Bar>execute "normal! o\<ESC>k0f?i\<CR>"<Bar>execute url_line . ',' . (url_line + 1) . 'g/&/s/&/\r&/g'<Bar>execute (url_line + 1) . ',''}s/[^?&]\+/\=Url_decode(submatch(0))/g'<Bar>execute 'norm! ' . (url_line) . 'G'<Bar>execute 'normal! }dd'
command! -range EncodeUrl execute "normal! gv" | execute "'<,'>s/^[&?]\\zs.*/\\=Url_encode(submatch(0))/g" | '<,'>join! | normal! Vgvl

"prettify json using jq
vnoremap <silent> <space>jq<space> :!jq<cr>
vnoremap <silent> <space>jqs<space> :!jq -S<cr>
nnoremap <silent> <space>jq<space> :%!jq<cr>
nnoremap <silent> <space>jqf<space> :%!cq -i json -o json<cr>:%!jq<cr>:set ft=json<cr>:set fdm=syntax<cr>:syntax on<cr>
nnoremap <silent> <space>jqs<space> :%!jq -S<cr>
nnoremap <silent> <space>gst<space> :tabnew<cr>:RenameTab GitSt<cr>:0read !git st<cr>

"prettify sql using sqlformat (Run `pip3 install sqlparse` to install )
nnoremap <silent> <space>fsql<space> :%!sqlformat -r -k "upper" -<cr>
vnoremap <silent> <space>fsql<space> :!sqlformat -r -k "upper" -<cr>

"prettify xml using xmllint
nnoremap <silent> <space>fxml<space> :%!xmllint --format -<cr>
vnoremap <silent> <space>fxml<space> :!xmllint --format -<cr>

"prettify html using html-tidy
nnoremap <silent> <space>fhtm<space> :%!tidy -i -q -w 2048 --show-warnings no --output-html yes --merge-divs no<cr>
vnoremap <silent> <space>fhtm<space> :!tidy -i -q -w 2048 --show-warnings no --output-html yes --merge-divs no<cr>

"unescape string content
nnoremap <silent> <space>decs<space> :%!bb -i -o -e '(->> *input* (map \#(-> \% (str/replace "\\\\" "$^_^$") (str/replace "\\n" "\n") (str/replace "\\\"", "\"") (str/replace "\\t" "\t") (str/replace "$^_^$" "\\"))) str/join)'<cr>
vnoremap <silent> <space>decs<space> :!bb -i -o -e '(->> *input* (map \#(-> \% (str/replace "\\\\" "$^_^$") (str/replace "\\n" "\n") (str/replace "\\\"", "\"") (str/replace "\\t" "\t") (str/replace "$^_^$" "\\"))) str/join)'<cr>

"prettify css using cssbeautifier ( pip install cssbeautifier )
nnoremap <silent> <space>fcss<space> :%!css-beautify -i<cr>
vnoremap <silent> <space>fcss<space> :!css-beautify -i<cr>

"prettify js using jsbeautifier ( pip install jsbeautifier )
nnoremap <silent> <space>fjs<space> :%!js-beautify<cr>
vnoremap <silent> <space>fjs<space> :!js-beautify<cr>

"prettify spl (splunk query)
nnoremap <silent> <space>splf<space> :s/\(   \+\\| \ze\|\)/\r/g<cr>:nohl<cr>

"prettify python
nnoremap <silent> <space>fpy<space> :%!black --quiet --line-length=100 --skip-string-normalization -<cr>
xnoremap <silent> <space>fpy<space> :!black --quiet --line-length=100 --skip-string-normalization -<cr>


"get json path
nnoremap <silent> <space>jp<space> :w !java -jar ~/dev/zhizhi/json-path/target/uberjar/json-path-0.1.0-standalone.jar -l <c-r>=line(".")<cr> -c <c-r>=col(".")<cr><cr>

"}}}

"########## Neotree ##########{{{
" Prompt execute Neotree commend to trigger lazy loading
" nnoremap <Space>su<Space>  :echo "Execute :Neotree first"<cr>
" nnoremap <Space>so<Space>  :echo "Execute :Neotree first"<cr>
" nnoremap <Space>si<Space>  :echo "Execute :Neotree first"<cr>
"}}}

"########## Simple Autoclose ##########{{{
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
"}}}

"########## Symbol outline ##########{{{
nnoremap <silent> <space>fefo<space> <cmd>SymbolsOutline<cr>
nnoremap <silent> <space>fefO<space> <cmd>SymbolsOutlineClose<cr>
"}}}

"########## Run Command ##########{{{
nmap <space>sh<space> <cmd>lua require'toggleterm'.exec(vim.fn.getline('.'), 2)<cr>
xmap <space>sh<space> "ny:lua require'toggleterm'.exec(vim.fn.getreg('n'), 2)<cr>

command! ShInline let @n='mp"pyy}}:=line("$")==line(".")?"":"norm! 1k"vip"pp:.!zsh`p' | norm! @n
nnoremap <space>shi<space> <cmd>ShInline<CR>

command! TocInline let @n='dip:<C-R>=line("$")==line(".")?"":"norm! 1k"<CR><CR>:r !exa --long --icons --group-directories-first --no-permissions --no-user --no-time --level=3 <C-R>=expand("%:p:h")<CR><CR>' | norm! @n
nnoremap <space>sht<space> <cmd>ShInline<CR>

"}}}

"########## VimCalc3 ##########{{{
nnoremap <silent> \cl <cmd>Calc<CR>
"}}}

"########## Simple Slides ##########{{{
let g:toilet_font="future"
let g:cowsay_file="default"
function! EnableSlide()
  setl so=0 nonu wrapscan
  nnoremap <silent> <buffer> <PageDown> :setl lazyredraw<cr>/\(\n\{10\}.\\|\%^\)/e<cr>:nohl<cr>zt:setl nolazyredraw<cr>
  nnoremap <silent> <buffer> <PageUp>   :setl lazyredraw<cr>?\(\n\{10\}.\\|\%^\)?e<cr>:nohl<cr>zt:setl nolazyredraw<cr>

  nmap <silent> <buffer> <c-j> <PageDown>
  nmap <silent> <buffer> <c-k> <PageUp>

  nnoremap <silent> <buffer> <c-t><c-t> :.!toilet -w 300 -f <c-r>=g:toilet_font<cr><cr>:<c-u>StripTrailingWhitespace<cr>
  xnoremap <silent> <buffer> <c-t><c-t> :!toilet -w 300 -f <c-r>=g:toilet_font<cr><cr>:<c-u>StripTrailingWhitespace<cr>
  nnoremap <silent> <buffer> <c-t><c-r> :.!cowsay -f <c-r>=g:cowsay_file<cr><cr>:<c-u>StripTrailingWhitespace<cr>
  xnoremap <silent> <buffer> <c-t><c-r> :!cowsay -f <c-r>=g:cowsay_file<cr><cr>:<c-u>StripTrailingWhitespace<cr>
  nnoremap <silent> <buffer> <c-t><c-y> :e ~/.config/nvim/toilet_font.vim<CR><C-L>
  nnoremap <silent> <buffer> <c-t><c-u> :e ~/.config/nvim/cowfiles.vim<CR><C-L>
endfunction
"}}}

"########## Text Objects ##########{{{
onoremap ih) :<c-u>norm! m`vi)o``<cr>
onoremap ih( :<c-u>norm! m`vi)``<cr>
onoremap ih] :<c-u>norm! m`vi]o``<cr>
onoremap ih[ :<c-u>norm! m`vi]``<cr>
onoremap ih} :<c-u>norm! m`vi}o``<cr>
onoremap ih{ :<c-u>norm! m`vi}``<cr>
"}}}

" MODELLINE {{{
" vim: set ts=2 sts=-1 sw=0 et tw=70 ft=vim fdm=marker:
" }}}

