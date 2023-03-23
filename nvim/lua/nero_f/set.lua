local opt = vim.opt

opt.nu=true
opt.relativenumber=true
opt.splitright=true
opt.splitbelow=true
opt.swapfile=false
opt.cul=true
opt.hlsearch=false
opt.wrap=false
opt.incsearch=true
opt.background="dark"
opt.encoding="UTF-8"
opt.termguicolors=true
opt.scrolloff=10
opt.ignorecase=true
opt.smartcase=true
opt.wildignore = "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append "Cargo.lock"

--opt.pumblend = 17
--opt.wildmode = "longest:full"
--opt.wildoptions = "pum"

vim.g.goyo_width=120

vim.cmd[[colorscheme onedark_dark]]
vim.cmd[[highlight PmenuSel ctermbg=Gray guibg=Gray]]
