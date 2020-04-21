require("autosave").setup({
	enabled = true,
	execution_message = "Autosaved at " .. vim.fn.strftime("%H:%M:%S"),
	events = { "InsertLeave", "TextChanged" },
	conditions = {
		exists = true,
		filename_is_not = {"plugins.lua"},
    -- I don't want to autosave javascript files as it triggers yarn build and slows down the whole machine in summer afternoon
		filetype_is_not = {"javascript"},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 1000,
	debounce_delay = 15000,
})
