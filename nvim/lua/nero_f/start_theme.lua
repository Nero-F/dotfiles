local th = require('nero_f.theme')
th.section.header.opts.position = "center"

th.section.top_buttons.val = {
  th.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
}
-- disable MRU
th.section.mru.val = { { type = "padding", val = 0 } }
th.section.bottom_buttons.val = {
  th.button( "q", "  Quit NVIM" , ":qa<CR>"),
}

require('alpha').setup(th.config)
