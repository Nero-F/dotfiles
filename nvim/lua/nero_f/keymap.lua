vim.g.mapleader=','

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = false })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

--------------------------------------------------------------------------------------------

imap("jk", "<Esc>l")
imap("kj", "<Esc>")
imap("JK", "<Esc>l")
imap("KJ", "<Esc>")
imap("jK", "<Esc>")
imap("kJ", "<Esc>")
imap("Jk", "<Esc>")
imap("Kj", "<Esc>")
imap("<A-j>", "<Esc>:m .+1<CR>==gi")
imap("<A-k>", "<Esc>:m .-2<CR>==gi")
--------------------------------------------------------------------------------------------

tmap("<c-a>t", "exit<cr>")
tmap("<Esc>", "<C-\\><C-n>")
tmap("jk", "<C-\\><C-n>")
tmap("kj", "<C-\\><C-n>")
tmap("JK", "<C-\\><C-n>")
tmap("KJ", "<C-\\><C-n>")

--------------------------------------------------------------------------------------------

nmap("<leader>xz", ":Goyo<cr>")
nmap("<space>j", ":cnext<cr>")
nmap("<space>k", ":cprev<cr>")
nmap("<space>o", ":copen<cr>")
nmap("<space>q", ":cclose<cr>")
nmap("<C-l>", "<C-w><C-l>")
nmap("<C-h>", "<C-w><C-h>")
nmap("<C-j>", "<C-w><C-j>")
nmap("<C-k>", "<C-w><C-k>")
nmap("<A-j>", ":m .+1<CR>==")
nmap("<A-k>", ":m .-2<CR>==")
nmap("<leader>t", "<Plug>PlenaryTestFile")

-- need a change
nmap("<leader>ev", ":tabnew $MYVIMRC<cr>")
nmap("<leader>evs", ":vsplit $MYVIMRC<cr>")
nmap("<leader>sv", ":source $MYVIMRC<cr>")

-- Telescope
nmap("<leader>p", "<cmd>Telescope git_files<cr>")
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>b", "<cmd>Telescope buffers<cr>")
nmap("<C-s>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
nmap("<leader>fb", "<cmd>Telescope file_browser<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nmap("<leader>frc", "<cmd>lua require('nero_f.seecrete').search_dotfiles()<cr>")
nmap("<leader>r", "<cmd>lua require('plenary.reload').reload_module('epitech') <bar> lua require('epitech')<cr>")

-- DAP

nmap('<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]])
nmap('<F9>', [[:lua require"dap".continue()<CR>]])
nmap('<F10>', [[:lua require"dap".step_over()<CR>]])
nmap('<S-F10>', [[:lua require"dap".step_into()<CR>]])
nmap('<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]])
nmap('<F5>', [[:lua require"osv".launch({port = 8086})<CR>]])

--------------------------------------------------------------------------------------------

vmap("<A-j>", ":m '>+1<CR>gv=gv")
vmap("<A-k>", ":m '<-2<CR>gv=gv")
vmap("q", "<Esc>")

