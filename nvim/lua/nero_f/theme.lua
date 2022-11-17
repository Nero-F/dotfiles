local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable
local default_header = {
  type = "text",
  val = {
    "                                                            µ",
    "                ╟╗>                                        _╬▌",
    "                ²╣╗²                                      (╬▌`",
    "               ²Φ²╚╢_                                    ╓▀Ñ>╣M",
    "               ║╣∩          »           ²╬▌▌▌µ   ╗,         ╓▀▌²",
    "              ²╣²ß        ╓╝            (▌▌▀╠║▄▄,>▀▄        ╫²▌∩",
    "              ╓Ñ ²      ²║Ñ`            ²`æ╬▌▀▀▀Ñ²²╠▌_      Ñ²╠▌",
    "              ß     ,   ║▒               ╓&▄>╠▌▌▌² ²▀▌¼  #     ▀",
    "                    ╣∩²>╣M              ║▌▌▌▌╗║▌▌▌²²║▌M²(╣M",
    "                _  ²╣∩²J╣∩              ²▀▀▀▀ÑÑQQ_ ²²▌░²(▌M²¥╓_,",
    "             _ê╓M  ²╟M>²╣M              ╫▌▌╟▌▌M╫▌▌¼>╟▌M¼╟▌¼²╡╫▌╫╗_",
    "            (╣M║╣>  ╚╣²²║╣_            ╟▌▌╗╚▀▌▀║▌M²(▌▌²²▌É¼║Ñ╬▌║▌M",
    "           ²║╣¼╣╣M   ║╗²²║╣_          ²╚▀▀▀║╣▌F¼` ╓▌▀²¼╬▌@(▌╟▌▌M╣▌`",
    "            ║╣¼M╚╣m  `╚╗²>╚╣Q>         ²╓╫╣Ñ▀▀▀>╔╫▌Ñ¼╓╬▀╓MÑ║▌▀╠M╣▌¼",
    "           ²Φ║M%²²╘_   ╚╣╗²²╙╣╗_>       ▀▀M` ²╓╫▌▀²╓╫▌Ñ#Ü²╓▀V¼╣║▌╣M",
    "           ²╣MÑ²Ç       ²╚╫╗QNÑ╚╣╗_       ²╓╫▀▀Ñ(╓╬▀Ñ╓╝` √²╓Θ║Q╚╟▌M",
    "           (╣╣Ü╚⌂≡         ²╚╫╗Q%²╚╫╗`  ²╫▀▀²╓▄╣▀▀Qæ╝<  _╓╝╓╫╓▒Ñ╫▀M",
    "           (M²²║║╗Ñ»           ╚Ñ╣Φ║╣²  ²╣É╫▌▀Ñ▄╣▀Ñ²_╓▄╝Ñ╓╣Ñ╫▀╣²²╟F",
    "           7M  ²╣╚╣╣╗Q_         ²║╡║╪>  ²▌É╫▌╚Ü²²╓╫▀▀Ñ²,▄╫▌▌▀▌M² ▐M",
    "               ²Φ¼²²²<²╚╝╖_     ²║╡║╪¼  ²▌▒╫▌>    ²╓╫▀▀Ñ²(_²²▌M",
    "                Φ²╫M▄████▄▄▄N  (╫╝Ñ²╝∩  ²▀Ü╚▀▌£`╓ΦÜ▄▄████▄╠▌M╫∩",
    "                ╚µ>╟▒█████████`   ²_»╜╝▀▀æ╖_`` ²█████████▓▌Ü╟Ñ",
    "             &    ºε╚╣QÇ╠▒_▒²`              `   ╓,╠▒▒▒w▄▌▀#Ñ¬   ╣",
    "             ║╗>      `²Ü²Ö7║▌Q               (╟▌▀ÑÜ`²`² `    (╬▌`",
    "             ²╣╣_           ²║╣╗»>__QQ╓╗▄▄╗Q,»╫▌▀²           (▌▌²",
    "             ²║╣╣⌂          -_╚╣╝╝ÑÑ∩∩ÑÖÑÑ╚▀▀▀▀Ñ╓F         .╓▌▌▒`",
    "              ²║╣▌M>_ _,     7»`╓_`         ,æ»╬Ö    _╓┐ 4∩║▌▌▌²",
    "               ²╣╣M║`  ╓╣µ       `╣∩      (▌-`     ²╟▌╗` `▌Ñ▀▌M`",
    "                ²≥Ñ    ²╣╣╗>      ╚M      ╠▌      ╓╣▌▌╟M  `╚╣Ç`",
    "                 M      ²╣╣╣_                   .╓▌▌▌Ç╚▌    (∩",
    "                         ²║╣╣∩              ⌡  _²▌▌▌╟▌²╚∩",
    "                         ²╢╣Ñ²              (,²¥²╫▌▌╚▌`",
    "                        ²║╣╣M                ▌²7M║▌▌▌╫²",
    "                        ²╣╣╪²                ╠b²▌║▀▌▌Ö",
    "                       ²║╣╣M`      M      4M²(▌¼╟▌╟▌▌▌¼",
    "                       ²║╣╣∩      (M      ╟M²²▀▌Ñ▌∩▌▌▀²",
    "                         ²Ñ      ╔╣M     ²╫▌╗@╠▌M╠▌▀Ñ",
    "                                ²╣╣╣∩   `╓▌▌▌∩╙▀²`",
    "                                 `²7Γ    ÑÑ`²",
    "                                                                            ",
    "      ::::    ::: :::::::::: :::::::::   ::::::::                :::::::::::",
    "     :+:+:   :+: :+:        :+:    :+: :+:    :+:               :+:+:+:+:+:",
    "    :+:+:+  +:+ +:+        +:+    +:+ +:+    +:+               +:+",
    "   +#+ +:+ +#+ +#++:++#   +#++:++#:  +#+    +:+ +#++:++#++:   +#+:+#+:#",
    "  +#+  +#+#+# +#+        +#+    +#+ +#+    +#+               +#+:+#+:#",
    " #+#   #+#+# #+#        #+#    #+# #+#    #+#               #+#",
    "###    #### ########## ###    ###  ########                #+#",
  },
  opts = {
    hl = "Type",
    shrink_margin = false,
    wrap = "overflow";
  },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = "[" .. sc .. "] ",
        cursor = 49,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = { { "Operator", 0, 1 }, { "Number", 1, #sc + 1 }, { "Operator", #sc + 1, #sc + 2 } },
        shrink_margin = false,
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, { noremap = false, silent = true, nowait = true } }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local nvim_web_devicons = {
    enabled = true,
    highlight = true,
}

local function get_extension(fn)
    local match = fn:match("^.+(%..+)$")
    local ext = ""
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end

local function icon(fn)
    local nwd = require("nvim-web-devicons")
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn,autocd)
    short_fn = if_nil(short_fn, fn)
    local ico_txt
    local fb_hl = {}
    if nvim_web_devicons.enabled then
        local ico, hl = icon(fn)
        local hl_option_type = type(nvim_web_devicons.highlight)
        if hl_option_type == "boolean" then
            if hl and nvim_web_devicons.highlight then
                table.insert(fb_hl, { hl, 0, 1 })
            end
        end
        if hl_option_type == "string" then
            table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
        end
        ico_txt = ico .. "  "
    else
        ico_txt = ""
    end
    local cd_cmd = (autocd and " | cd %:p:h" or "")
    local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. cd_cmd .." <CR>")
    local fn_start = short_fn:match(".*[/\\]")
    if fn_start ~= nil then
        table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
    ignore = function(path, ext)
        return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
    end,
    autocd = false
}

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
    opts = opts or mru_opts
    items_number = if_nil(items_number, 10)
    local oldfiles = {}
    for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles == items_number then
            break
        end
        local cwd_cond
        if not cwd then
            cwd_cond = true
        else
            cwd_cond = vim.startswith(v, cwd)
        end
        local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
        if (filereadable(v) == 1) and cwd_cond and not ignore then
            oldfiles[#oldfiles + 1] = v
        end
    end

    local tbl = {}
    for i, fn in ipairs(oldfiles) do
        local short_fn
        if cwd then
            short_fn = fnamemodify(fn, ":.")
        else
            short_fn = fnamemodify(fn, ":~")
        end
        local file_button_el = file_button(fn, tostring(i + start - 1), short_fn,opts.autocd)
        tbl[i] = file_button_el
    end
    return {
        type = "group",
        val = tbl,
        opts = {},
    }
end

local function mru_title()
    return "MRU " .. vim.fn.getcwd()
end

local section = {
    header = default_header,
    top_buttons = {
        type = "group",
        val = {
            button("e", "New file", "<cmd>ene <CR>"),
        },
    },
    -- note about MRU: currently this is a function,
    -- since that means we can get a fresh mru
    -- whenever there is a DirChanged. this is *really*
    -- inefficient on redraws, since mru does a lot of I/O.
    -- should probably be cached, or maybe figure out a way
    -- to make it a reference to something mutable
    -- and only mutate that thing on DirChanged
    mru = {
        type = "group",
        val = {
            { type = "padding", val = 1 },
            { type = "text", val = "MRU", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            {
                type = "group",
                val = function()
                    return { mru(10) }
                end,
            },
        },
    },
    mru_cwd = {
        type = "group",
        val = {
            -- { type = "padding", val = 1 },
            -- { type = "text", val = mru_title, opts = { hl = "SpecialComment", position = "center",shrink_margin = false } },
            { type = "padding", val = 1 },
            {
                type = "group",
                val = function()
                    return { mru(0, vim.fn.getcwd()) }
                end,
                opts = { type = "padding", shrink_margin = true , position = "center"},
            },
        },
    },
    bottom_buttons = {
        type = "group",
        val = {
            button("q", "Quit", "<cmd>q <CR>"),
        },
    },
    footer = {
        type = "group",
        val = {},
    },
}

local config = {
    layout = {
        { type = "padding", val = 1 },
        section.header,
        { type = "padding", val = 2 },
        section.top_buttons,
        section.mru_cwd,
        section.mru,
        { type = "padding", val = 1 },
        section.bottom_buttons,
        section.footer,
    },
    opts = {
        margin = 3,
        redraw_on_resize = false,
        setup = function()
            vim.api.nvim_create_autocmd('DirChanged', {
                pattern = '*',
                callback = function () require('alpha').redraw() end,
            })
        end,
    },
}

return {
    icon = icon,
    button = button,
    file_button = file_button,
    mru = mru,
    mru_opts = mru_opts,
    section = section,
    config = config,
    -- theme config
    nvim_web_devicons = nvim_web_devicons,
    leader = leader,
    -- deprecated
    opts = config,
}
