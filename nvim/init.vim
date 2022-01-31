" ============ VimPlug ============
call plug#begin(stdpath('data') . '/init.vim')

Plug 'Nero-F/vim-tek-header'
"Plug 'dbeniamine/cheat.sh-vim'

" ** Esthetic **
Plug 'ghifarit53/tokyonight-vim' " theme
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'

" ** code flow **
Plug 'jiangmiao/auto-pairs' " pairs
Plug 'numToStr/comment.nvim' " comment
Plug 'junegunn/goyo.vim'

Plug 'tpope/vim-surround' 
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'


" ** Telescope's stuff **
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'mfussenegger/nvim-dap' " DEBUGGER

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim' " pictograms 
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'


"Plug 's1n7ax/nvim-terminal'
"Plug 'lervag/vimtex'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'


Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'simrat39/rust-tools.nvim'


call plug#end()
" ============ End VimPlug ============

" KEYMAPS
let mapleader = ","
" escape
inoremap jk <Esc>l
inoremap kj <Esc>
inoremap JK <Esc>l
inoremap KJ <Esc>
inoremap jK <Esc>
inoremap kJ <Esc>
inoremap Jk <Esc>
inoremap Kj <Esc>
vnoremap q <Esc>
" exit terminal
tnoremap <c-a>m exit<cr>
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
tnoremap JK <C-\><C-n>
tnoremap KJ <C-\><C-n>
" mouving :line up and down
vnoremap J :m '>+1<cr>gv=gv
vn"oremap K :m '<-2<cr>gv=gv
" rc's ones
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>evs :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" quickfix list
nnoremap <space>j :cnext<cr>
nnoremap <space>k :cprev<cr>
nnoremap <space>o :copen<cr>
nnoremap <space>q :cclose<cr>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" SETTINGS
set guicursor=
set nu rnu
set splitright
set splitbelow
set noswapfile
set cul
set nohlsearch
set nowrap
set incsearch

" THEME
colorscheme tokyonight

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_cursor = 'red'
let g:tokyonight_current_word = 'bold'
let g:tokyonight_transparent_background = 1
set background=dark
set encoding=UTF-8

" FUGITIVE 
"nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gs :G<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>glg :Git log --stat --max-count=10<cr>
nnoremap <leader>glgg :Git log --graph --max-count=10<cr>

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"** Goyo **
nnoremap <leader>xz :Goyo<cr>
let g:goyo_width = 190

filetype plugin on 

noremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <C-s> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr> TELESCOPE
nnoremap <leader>frc <cmd>lua require('nero_f.seecrete').search_dotfiles()<cr>
nnoremap <leader>fs <cmd>lua require('nero_f.seecrete').seecrete()<cr>

" ** FloatTerm **
nnoremap <leader>ft <cmd>FloatermNew<cr>

" ** LSP stuffs **

lua << EOF

local nvim_lsp = require('lspconfig')

local function on_attach(client, bufnr)
	--local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', "v:lua.vim.lsp.omnifunc")

	local opts = { noremap=true, silent=true }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
	vim.keymap.set('n', '<C-d>k', vim.lsp.diagnostic.goto_next)
	vim.keymap.set('n', '<C-d>j', vim.lsp.diagnostic.goto_prev)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
	vim.keymap.set('n', '<leader>fm', vim.lsp.buf.formatting)
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
	}
	if server.name == "rust_analyzer" then
		opts = {
			on_attach = on_attach,
			checkOnSave = { enable = false },
		}
		require("rust-tools").setup {
		    server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		}
		server:attach_buffers()
	else
		server:setup(opts)
	end
end)


EOF

" LSP config (the mappings used in the default file don't quite work right)
"nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-d>j <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-d>k <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

let g:c_syntax_for_h = 1
lua << EOF
-- highlight baby
require"nvim-treesitter.configs".setup { highlight = { enable = true } }

local actions = require("telescope.actions")

require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next
			}
		}
	}
}
-- lsp setup

--local function setup_servers()
--	require'lspinstall'.setup{}
--	local servers = require'lspinstall'.installed_servers()
--
--	for _, server in pairs(servers) do
--		if server == "rust" then 
--			require'lspconfig'[server].setup{
--				settings = {
--					["rust-analyzer"] = { checkOnSave = { enable = false } }
--				}
--			}
--		else
--			require'lspconfig'[server].setup{}
--		end
--	end
--end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true


-- Cmp setup

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
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
	experimental = {
		native_menu = false,
		ghost_text = true,
	}
}

require('Comment').setup {
	opleader = {
		line = 'gc',
		block = 'gb',
	},
	mappings = {
		basic = true,
		extra = true
	}
}

--require'compe'.setup {
  --enabled = true;
  --autocomplete = true;
  --debug = false;
  --min_length = 1;
  --preselect = 'enable';
  --throttle_time = 80;
  --source_timeout = 200;
  --incomplete_delay = 400;
  --max_abbr_width = 100;
  --max_kind_width = 100;
  --max_menu_width = 100;
  --documentation = true;
--
  --source = {
    --path = true;
    --nvim_lsp = true;
  --};
--}
--
--local t = function(str)
  --return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--local check_back_space = function()
    --local col = vim.fn.col('.') - 1
    --if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        --return true
    --else
        --return false
    --end
--end
--
---- Use (s-)tab to:
----- move to prev/next item in completion menuone
----- jump to prev/next snippet's placeholder
--_G.tab_complete = function()
  --if vim.fn.pumvisible() == 1 then
    --return t "<C-n>"
  --elseif check_back_space() then
    --return t "<Tab>"
  --else
    --return vim.fn['compe#complete']()
  --end
--end
--_G.s_tab_complete = function()
  --if vim.fn.pumvisible() == 1 then
    --return t "<C-p>"
  --else
    --return t "<S-Tab>"
  --end
--end
--
--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--
----This line is important for auto-import
--vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
--vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
--
EOF
