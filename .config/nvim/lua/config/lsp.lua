local api = vim.api
local lsp = vim.lsp
local protocol = require'vim.lsp.protocol'

local M = {}

function M.show_line_diagnostics()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',  -- show source in diagnostic popup window
    prefix = ' '
  }
  vim.diagnostic.open_float(nil, opts)
end

local custom_attach = function(client, bufnr)

  -- Mappings.
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "m", vim.lsp.buf.hover)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<M-p>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa<space>", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr<space>", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl<space>", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set("n", "<space>rn<space>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>q<space>", function() vim.diagnostic.setqflist({open = true}) end, opts)
  vim.keymap.set("n", "<space>ca<space>", vim.lsp.buf.code_action, opts)

  vim.cmd([[
    autocmd CursorHold <buffer> lua require('config.lsp').show_line_diagnostics()
  ]])

  -- Set some key bindings conditional on server capabilities
  vim.keymap.set("n", "<space>f<space>", function() vim.lsp.buf.format {sync=true, timeout_ms=5000} end, opts)
  vim.keymap.set("x", "<space>f<space>", function() vim.lsp.buf.range_format {sync=true, timeout_ms=5000} end, opts)
  -- if client.server_capabilities.document_formatting then
  -- end
  -- if client.server_capabilities.document_range_formatting then
  -- end

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.server_capabilities.document_highlight then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  if vim.g.logging_level == 'debug' then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, 'info', {title = 'Nvim-config'})
  end

  -- formatting
  if client.name == 'tsserver' then
    client.server_capabilities.document_formatting = false
  end

  if client.server_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
  on_attach = custom_attach,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = false, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        jedi_completion = { fuzzy = false },
        pyls_isort = { enabled = false },
        pylsp_mypy = { enabled = false },
        python_lsp_black = {
          enabled = false,
          skip_string_normalization = true,
          line_length = 100
        },
      },
    },
  },
  flags = {
    debounce_text_changes = 3000,
  },
  -- capabilities = capabilities,
})

-- lspconfig.pyright.setup{
--   on_attach = custom_attach,
--   capabilities = capabilities
-- }

lspconfig.clangd.setup({
  on_attach = custom_attach,
  -- capabilities = capabilities,
  filetypes = { "c", "cpp", "cc" },
  flags = {
    debounce_text_changes = 500,
  },
})

-- set up vim-language-server
lspconfig.vimls.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  -- capabilities = capabilities,
})

-- set up flow.js language server
-- lspconfig.flow.setup({
--   on_attach = custom_attach,
--   filetypes = { "javascript" },
--   capabilities = capabilities,
-- })

lspconfig.tsserver.setup {
  on_attach = custom_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

-- lspconfig.jsonls.setup {
--   on_attach = custom_attach,
--   filetypes = { "json" },
--   cmd = { '/Users/zdeng/.nvm/versions/node/v12.22.1/bin/vscode-json-languageserver', '--stdio' },
--   -- Set the schema so that it can be completed in settings json file.
--   -- The schemas defined in `jsonls.json` will be merged with the list configured here.
--   settings = {
--     json = {
--       schemas = require'nlspsettings.jsonls'.get_default_schemas()
--     }
--   }
-- }

-- set up sumneko lua language server

-- local sumneko_binary_path = vim.fn.exepath("lua-language-server")
local sumneko_binary_path = "/opt/homebrew/bin/lua-language-server"
if vim.g.is_mac or vim.g.is_linux and sumneko_binary_path ~= "" then
  -- local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")
  local sumneko_root_path = "/opt/homebrew/bin/lua-language-server"

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require("lspconfig").lua_ls.setup({
    on_attach = custom_attach,
    cmd = { sumneko_binary_path, sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
    -- capabilities = capabilities,
  })
end

-- Setup Terraform
lspconfig.terraformls.setup {
  on_attach = custom_attach,
  filetypes = { 'terraform' },
}

-- Setup linter (Disable, handled by null-ls)
-- lspconfig.diagnosticls.setup {
--   on_attach = custom_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       eslint_d = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--       },
--       prettier = {
--         command = 'prettier_d_slim',
--         rootPatterns = { '.git' },
--         -- requiredFiles: { 'prettier.config.js' },
--         args = { '--stdin', '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'prettier',
--       javascriptreact = 'prettier',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'prettier',
--       typescriptreact = 'prettier',
--     }
--   }
-- }

-- ---------------------------------------------------------------------------------------------------------------
-- Formatting via efm
-- It doesn't use the eslint config in the project, maybe need more configuration but I don't have time for it yet
-- ---------------------------------------------------------------------------------------------------------------
-- local prettier = require "efm/prettier"
-- local eslint = require "efm/eslint"
-- local luafmt = require "efm/luafmt"
-- local rustfmt = require "efm/rustfmt"
-- -- local autopep = require "efm/autopep8"

-- local languages = {
--     lua = {luafmt},
--     -- typescript = {prettier, eslint},
--     javascript = {prettier, eslint},
--     -- typescriptreact = {prettier, eslint},
--     javascriptreact = {prettier, eslint},
--     yaml = {prettier},
--     -- json = {prettier},
--     html = {prettier},
--     scss = {prettier},
--     css = {prettier},
--     markdown = {prettier},
--     rust = {rustfmt}
--     -- python = {autopep}
-- }

-- lspconfig.efm.setup {
--     root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
--     filetypes = vim.tbl_keys(languages),
--     init_options = {documentFormatting = true, codeAction = true},
--     settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
--     on_attach = custom_attach
-- }

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = true,
  severity_sort = true,
})


-- --------------------------------------------------------------------------------------------
-- Virtual text warning (more obvious but sometimes mess up the actual content so I disabled it
-- --------------------------------------------------------------------------------------------
-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = {
--     spacing = 4,
--     prefix = ''
--   },
--   signs = true,
--   update_in_insert = false,
-- })

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

return M
