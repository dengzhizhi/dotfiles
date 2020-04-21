nmap <buffer> <nowait> d :exec g:Lf_py "rgExplManager.deleteCurrentLine()"<CR>
noremap <buffer> <nowait> v v
noremap <buffer> <nowait> sv :exec g:Lf_py "rgExplManager.accept('v')"<CR>
nmap <buffer> <nowait> <silent> P <CMD>let g:Lf_PreviewCode = 1 - g:Lf_PreviewCode<CR>
