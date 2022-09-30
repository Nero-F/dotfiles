local cmp = require'cmp'
local lspkind = require'lspkind'
lspkind.init()

cmp.setup {
	mapping = {
		--["<C-d>"] = cmp.mapping.scroll_docs(-4),
		--["<C-f>"] = cmp.mapping.scroll_docs(4),
		--["<C-y>"] = cmp.mapping.confirm {
			--behavior = cmp.ConfirmBehavior.Insert,
			--select = true,
		--},
		--["<C-q>"] = cmp.mapping.confirm {
			--behavior = cmp.ConfirmBehavior.Insert,
			--select = true,
		--},
        ["<CR>"] = cmp.mapping(
        { 
                i = cmp.mapping.confirm({ select = true }),
                c = cmp.mapping.confirm({ select = false }) 
        }),
        ["<Tab>"] = function(fallback) 
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback) 
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
	},
	sources = {
		{ name = "nvim_lsp"},
		{ name = "path" },
		{ name = "zsh" },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buff]",
				nvim_lsp = "[LSP]",
				path = "[path]",
			}
		}
	},
        --snippet = {
            --expand = function(args)
                --vim.fn["vsnip#anonymous"](args.body)
            --end,
        --},
	experimental = {
		native_menu = false,
		ghost_text = true,
	}
}

