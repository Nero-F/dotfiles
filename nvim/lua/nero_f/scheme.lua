local gset = vim.api.nvim_set_var

gset('airline#extensions#tabline#enabled', 1)
gset('airline_powerline_fonts', 1)


gset('tokyonight_style', 'night')
gset('tokyonight_enable_italic', 1)
gset('tokyonight_cursor', 'red')
gset('tokyonight_current_word', 'bold')
gset('tokyonight_transparent_background', 1)

vim.cmd[[colorscheme tokyonight]]

