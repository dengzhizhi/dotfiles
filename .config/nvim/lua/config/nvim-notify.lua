local nvim_notify = require("notify")
nvim_notify.setup({
  -- Animation style
  stages = "static",
  -- Default timeout for notifications
  timeout = 2000,
  background_colour = "#2E3440",
})

vim.notify = nvim_notify
