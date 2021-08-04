 local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< .NeoVim >",
		cwd = "~/.config/nvim/",
	})
end

M.seecrete = function()
	require("telescope.builtin").find_files({
		prompt_title = "< DotFiles Seecretes >",
		find_command = {
			'fd', "(^\\.env(rc)?$|^\\.[a-z-_]+.env|\\.env.\\w+)",
			"--no-ignore", "--hidden",
			"--exclude", "{node_modules, .git}"
		},
	})
end

return M
