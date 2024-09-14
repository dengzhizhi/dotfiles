require('bropilot').setup({
  model = vim.g.ai_model or "codegeex4:latest",
  -- model_params = {
  --   mirostat = 0,
  --   mirostat_eta = 0.1,
  --   mirostat_tau = 5.0,
  --   num_ctx = 2048,
  --   repeat_last_n = 64,
  --   repeat_penalty = 1.1,
  --   temperature = 0.8,
  --   seed = 0,
  --   stop = {},
  --   tfs_z = 1,
  --   num_predict = 128,
  --   top_k = 40,
  --   top_p = 0.9,
  -- },
  prompt = { -- FIM prompt for deepseek-coder-v2
    prefix = "<｜fim▁begin｜>",
    suffix = "<｜fim▁end｜>",
    middle = "<｜fim▁hole｜>",
  },
  debounce = 1000,
  keymap = {
    accept_word = "<C-BS>",
    accept_line = "<BS>",
    accept_block = "<S-BS>",
    resuggest = "<C-End>",
  },
})

