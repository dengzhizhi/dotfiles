nnoremap <silent> <space>dfj<space> <cmd>lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <space>dfk<space> <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>

nnoremap <silent> <c-left> <cmd>lua require("harpoon.ui").nav_next()<cr>
nnoremap <silent> <c-right> <cmd>lua require("harpoon.ui").nav_prev()<cr>
nnoremap <silent> <space><tab> <cmd>lua require("harpoon.ui").nav_prev()<cr>

nnoremap <silent> <space>df1 <cmd>lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent> <space>df2 <cmd>lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent> <space>df3 <cmd>lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent> <space>df4 <cmd>lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent> <space>df5 <cmd>lua require("harpoon.ui").nav_file(5)<cr>
