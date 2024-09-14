nnoremap <silent> <expr> - (v:count == 0 ? ':call bufferhint#Popup()<CR>' : '-')
nnoremap <silent> <TAB>f :call bufferhint#LoadPrevious()<CR>
inoremap <silent> <TAB>f <ESC>:call bufferhint#LoadPrevious()<CR>
xnoremap <silent> <TAB>f :<C-u>call bufferhint#LoadPrevious()<CR>
