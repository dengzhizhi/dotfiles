nnoremap <slient> n <Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>

nnoremap <slient> N <Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>

nnoremap <slient> * <Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>
nnoremap <slient> # <Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>
