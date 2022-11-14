require('dressing').setup({
  input = {
    enabled = true,
    default_prompt = "Input:",

    -- Can be 'left', 'right', or 'center'
    prompt_align = "center",

    -- When true, <Esc> will close the modal
    insert_only = true,

    start_in_insert = false,

    -- These are passed to nvim_open_win
    anchor = "SE",
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "win",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    -- Window transparency (0-100)
    winblend = 100,
    -- Change default highlight groups (see :help winhl)
    winhighlight = "NormalFloat:DiagnosticError",


    -- Set to `false` to disable
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
  },
})
