silent! unmap <leader>t
nnoremap <leader>ta :lua require("telescope").extensions.vstask.tasks(require('telescope.themes').get_dropdown())<CR>
nnoremap <space>jijtt<space> :lua require("telescope").extensions.vstask.tasks(require('telescope.themes').get_dropdown())<CR>
nnoremap <leader>ti :lua require("telescope").extensions.vstask.inputs(require('telescope.themes').get_dropdown())<CR>
nnoremap <leader>th :lua require("telescope").extensions.vstask.history(require('telescope.themes').get_dropdown())<CR>
nnoremap <leader>tl :lua require('telescope').extensions.vstask.launch()<cr>
