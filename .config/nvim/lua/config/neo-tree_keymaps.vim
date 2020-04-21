nnoremap <silent> <Space>su<Space> <cmd>Neotree left focus<CR>
nnoremap <silent> <Space>suu<Space> <cmd>Neotree float focus<CR>
nnoremap <silent> <Space>sui<Space> <cmd>Neotree close<CR>
nnoremap <silent> <Space>siu<Space> <cmd>Neotree close<CR>
nnoremap <silent> <Space>so<Space> <cmd>Neotree left show<CR>
nnoremap <silent> <Space>si<Space> <cmd>Neotree reveal<CR>
nnoremap <silent> <Space>sii<Space> <cmd>Neotree source=buffers reveal<CR>
nnoremap <silent> <Space>sgd<Space> <cmd>Neotree reveal_file=<cfile><CR>
" Copy full path of the current node (Need to open and close the help window
" first to ensure the current node points to the highlighted node)
nmap <silent> <Space>scp<Space> ?<esc><cmd>lua vim.fn.setreg("*", require("neo-tree.sources.manager").get_state("filesystem", nil, winid).position.node_id)<cr>:echo "<c-r>*"<cr>

