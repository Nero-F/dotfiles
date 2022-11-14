local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
        prompt_title = "< config files >",
        cwd = "~/.config/nvim/lua/nero_f",
        layout_strategy = "vertical",
        theme = "dropdown"
	})
end

M.seecrete = function()
	require("telescope.builtin").find_files({
		prompt_title = "< DotFiles Seecretes >",
		find_command = {
          'fd', "(^\\.env(rc)?$|^\\.[a-z-_]+.env|\\.env.\\w+|^.github$)",
			"--no-ignore", "--hidden",
			"--exclude", "{node_modules, .git}"
		},
	})
end

return M
