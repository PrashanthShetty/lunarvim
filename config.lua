-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
function addRelPath(dir)
    local spath =
        debug.getinfo(1, 'S').source
        :sub(2)
        :gsub("^([^/])", "./%1")
        :gsub("[^/]*$", "")
    dir = dir and (dir .. "/") or ""
    spath = spath .. dir
    package.path = spath .. "?.lua;"
        .. spath .. "?/init.lua"
        .. package.path
end

-- print(package.path)
addRelPath("lua")
-- package.path = 'lua/?.lua;' .. package.path
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = false          -- wrap lines
vim.opt.foldcolumn = "1"      -- '0' is not bad
vim.opt.foldlevel = 99        -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- If you're using transparent windows enable this setting
-- lvim.transparent_window = true

-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "kanagawa-wave"
lvim.colorscheme = "onenord"
-- lvim.builtin.dap.active = false

lvim.builtin.lualine.style = "default"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.telescope.theme = "flex"
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.telescope.on_config_done = function(telescope)
    -- telescope.load_extension("noice")
end


------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
    "go",
    "gomod",
    "gosum",
    "gowork",
    "lua",
}

-----------------------
-- Plugins
------------------------

lvim.plugins = {
    -- "olexsmir/gopher.nvim",
    require("finecmdline"),
    require("nvim-go"),
    require("nvim-ufo"),
    require("git-blame"),
    {
        "rmehri01/onenord.nvim",
        lazy = false,
    },
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "lewpoly/sherbet.nvim",
    "olimorris/onedarkpro.nvim",
    "rebelot/kanagawa.nvim",
    "EdenEast/nightfox.nvim",
    {
        "sho-87/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "anuvyklack/fold-preview.nvim",
        dependencies = "anuvyklack/keymap-amend.nvim",
        config = true
    },
    {
        "rcarriga/nvim-notify",
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },
}
------------------------
-- Formatting
------------------------
require("config.formatter-settings").setup()

------------------------
-- Dap
------------------------
lvim.builtin.dap.on_config_done = function(dap)
    -- require("dapui").setup()
    require('dap.ext.vscode').load_launchjs()
    require('dap-go').setup()

    vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<cr>")
    vim.keymap.set("n", "<F6>", "<cmd>lua require('dapui').toggle({reset = true})<cr>")
    vim.keymap.set("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
    vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>")
    vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>")
    vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>")
end
-------------------------
-- LSP
------------------------
require("config.lsp-settings").setup()

------------------------
-- Key Mappings
------------------------
require("config.keymapings").setup()
