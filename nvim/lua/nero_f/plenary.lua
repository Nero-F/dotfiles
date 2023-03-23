function _G.ReloadConfig()
  local pkgs = { "epitech.loader", "epitech.test_confirm","epitech.utils", "epitech.header",  "epitech.config", "epitech.coding_style", "epitech" }
  for _, pkg in pairs(pkgs) do
    P(pkg)
    package.loaded[pkg] = nil
    require(pkg)
  end
  require("epitech").setup()
  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_set_keymap('n', '<Leader>vr', '<Cmd>lua ReloadConfig()<CR>', { silent = false, noremap = true })
vim.cmd('command! ReloadConfig lua ReloadConfig()')
