if exists(':AsyncRun')
  nnoremap <buffer><silent> <F9> :<C-U>AsyncRun python -u "%"<CR>
endif

" Do not wrap Python source code.
setl nowrap
setl sidescroll=5
setl sidescrolloff=2
setl colorcolumn=120
setl textwidth=100

" For delimitMate
let b:delimitMate_matchpairs = "(:),[:],{:}"
