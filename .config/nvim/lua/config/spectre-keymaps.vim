command! SpectreOpen lua require('spectre').open()
nnoremap <silent> <space>gs<space> <cmd>lua require('spectre').open()<CR>
nnoremap <silent> <space>gsw<space> <cmd>lua require('spectre').open_visual({select_word=true})<CR>
xnoremap <silent> <space>gsw<space> <cmd>lua require('spectre').open_visual()<CR>

