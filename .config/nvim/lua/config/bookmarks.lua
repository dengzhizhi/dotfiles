require("bookmarks").setup({
    keymap = {
	toggle = ";m", -- Toggle bookmarks
	add = "<space>m<space>", -- Add bookmarks
	jump = "<CR>", -- Jump from bookmarks
	delete = "dd", -- Delete bookmarks
	order = "o", -- Order bookmarks by frequency or updated_time
	delete_on_virt = "<space>mv<space>", -- Delete bookmark at virt text line
	show_desc = "<space>mh<space>", -- show bookmark desc
    },
    preview_ext_enable = true, -- If true, preview buf will add file ext, preview window may be highlighed(treesitter), but may be slower.
    fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.
    virt_text = "🔖", -- Show virt text at the end of bookmarked lines
    virt_pattern = {
	'*.md',
	'*.ts',
	'*.tsx',
	'*.js',
	'*.jsx',
	'*.py',
	'*.java',
	'*.xml',
	'*.html',
    } -- Show virt text only on matched pattern
})
