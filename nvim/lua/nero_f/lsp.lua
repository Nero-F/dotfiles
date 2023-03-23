local function on_attach(client, bufnr)

	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', "v:lua.vim.lsp.omnifunc")

	local opts = { noremap=true, silent=true }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<C-d>k', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<C-d>j', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end)

end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
  }
  local s = {
    Lua = {
      diagnostics = {
	globals = {"vim"},
      },
      telemetry = {
	enable = false,
      },
    }
  }

  if server.name == "rust_analyzer" then
    opts = {
      on_attach = on_attach,
      checkOnSave = { enable = false, command = "clippy" },
    }
    require("rust-tools").setup {
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
    }
    server:attach_buffers()
  elseif server.name == "sumneko_lua" then
    server:setup({settings = s})
  else
    server:setup(opts)
  end
end)
