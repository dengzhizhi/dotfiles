nnoremap <silent> <space>fefj<space> <cmd>Telescope find_files theme=ivy<cr>
nnoremap <silent> <space>fefk<space> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <space>fefb<space> <cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>
nnoremap <silent> <space>fefu<space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <space>fefl<space> <cmd>Telescope buffers theme=ivy<cr>
nnoremap <silent> <space>fefh<space> <cmd>Telescope help_tags theme=ivy<cr>
nnoremap <silent> <space>fefp<space> <cmd>Telescope lsp_document_symbols theme=ivy<cr>
nnoremap <silent> <space>fefi<space> <cmd>Telescope diagnostics bufnr=0 theme=ivy<cr>
nnoremap <silent> <space>fefm<space> <cmd>Telescope marks theme=ivy<cr>
nnoremap <silent> <space>feff<space> <cmd>Telescope frecency theme=ivy<cr>

nnoremap <silent> <space>jijs<space> <cmd>Telescope git_status<cr>
nnoremap <silent> <space>jijf<space> <cmd>Telescope jumplist theme=ivy<cr>
nnoremap <silent> <space>jijc<space> <cmd>Telescope command_history theme=ivy<cr>
nnoremap <silent> <space>jijv<space> <cmd>Telescope search_history theme=ivy<cr>
nnoremap <silent> <space>jijz<space> <cmd>Telescope spell_suggest theme=ivy<cr>
nnoremap <silent> <space>jijt<space> <cmd>Telescope treesitter theme=ivy<cr>
nnoremap <silent> <space>jijb<space> <cmd>Telescope bookmarks theme=ivy<cr>

nnoremap <silent> <space>jijr<space> <cmd>Telescope resume<cr>

nnoremap <silent> <space>lsj<space> <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent> <space>lsk<space> <cmd>Telescope lsp_definitions<cr>
nnoremap <silent> <space>lsl<space> <cmd>Telescope lsp_type_definitions<cr>
nnoremap <silent> <space>lsu<space> <cmd>Telescope lsp_references<cr>
nnoremap <silent> <space>lsi<space> <cmd>Telescope lsp_incoming_calls<cr>
nnoremap <silent> <space>lso<space> <cmd>Telescope lsp_outgoing_calls<cr>
nnoremap <space>lsp<space> :Telescope lsp_workspace_symbols query=
nnoremap <silent> <space>lsjk<space> <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <silent> <space>lskj<space> <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
