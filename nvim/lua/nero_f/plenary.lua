function _G.ReloadConfig()
  local pkgs = { "epitech.utils", "epitech.header", "epitech.coding_style", "epitech.config", "epitech" }

  for _, pkg in pairs(pkgs) do
    P(pkg)
    package.loaded[pkg] = nil
    require(pkg)
  end
  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_set_keymap('n', '<Leader>vr', '<Cmd>lua ReloadConfig()<CR>', { silent = false, noremap = true })
vim.cmd('command! ReloadConfig lua ReloadConfig()')
