nnoremap <silent> <space>dj<space> :call VimuxRunCommand(getline('.'))<cr>
xnoremap <silent> <space>dj<space> :<c-u>call VimuxRunCommand(join(getline(line("'<"), line("'>")), "\n"))<cr>
xnoremap <silent> <space>djj<space> "cy:<c-u>call VimuxRunCommand(@c)<cr>
nnoremap <space>dk<space> :call VimuxRunCommand("")<left><left>
nnoremap <silent> <space>dh<space> :VimuxOpenRunner<cr>
nnoremap <silent> <space>dn<space> :VimuxCloseRunner<cr>
nnoremap <silent> <space>du<space> :VimuxTogglePane<cr>
nnoremap <silent> <space>dc<space> :call VimuxRunCommand("bb repl")")<cr>
nnoremap <silent> <space>dcc<space> :call VimuxRunCommand(":repl/quit")")<cr>
nnoremap <silent> <space>dl<space> :call VimuxSendKeys("C-L")<cr>
nnoremap <silent> <space>dii<space> :call VimuxRunCommand("cd <c-r>=expand("%:p:h")<cr>")<cr>
nnoremap <silent> <space>dio<space> :call VimuxRunCommand("cd <c-r>=getcwd()<cr>")<cr>
