require('fm-nvim').setup{
	-- Terminal commands used w/ file manager (have to be in your $PATH)
	cmds = {
		lf_cmd      = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
		fm_cmd      = "fm",
		nnn_cmd     = "nnn",
		fff_cmd     = "fff",
		twf_cmd     = "twf",
		fzf_cmd     = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
		fzy_cmd     = "find . | fzy",
		xplr_cmd    = "xplr",
		vifm_cmd    = "vifm",
		skim_cmd    = "sk",
		broot_cmd   = "broot",
		gitui_cmd   = "gitui",
		ranger_cmd  = "ranger",
		joshuto_cmd = "joshuto",
		lazygit_cmd = "lazygit",
	},

  -- Path to broot config
  broot_conf = vim.fn.stdpath("data") .. "/broot_conf.hjson",
}

vim.api.nvim_call_function('utils#Cabbrev', {"rr", "Ranger %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"ranger", "Ranger"})
vim.api.nvim_call_function('utils#Cabbrev', {"joshuto", "Joshuto"})
vim.api.nvim_call_function('utils#Cabbrev', {"lazygit", "Lazygit"})
vim.api.nvim_call_function('utils#Cabbrev', {"lg", "Lazygit"})
vim.api.nvim_call_function('utils#Cabbrev', {"xplr", "Xplr %:p"})
vim.api.nvim_call_function('utils#Cabbrev', {"vifm", "Vifm %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"nnn", "Nnn %:p"})
vim.api.nvim_call_function('utils#Cabbrev', {"fff", "Fff %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"twf", "Twf %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"fzf", "Fzf"})
vim.api.nvim_call_function('utils#Cabbrev', {"fzy", "Fzy"})
vim.api.nvim_call_function('utils#Cabbrev', {"lf", "Lf %:p"})
vim.api.nvim_call_function('utils#Cabbrev', {"fm", "Fm %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"br", "Broot %:p:h"})
vim.api.nvim_call_function('utils#Cabbrev', {"brc", "Broot"})
vim.api.nvim_call_function('utils#Cabbrev', {"gitui", "Gitui %:p:h"})
