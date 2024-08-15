local M = {}
M.setup = function()
    vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<cr>")
    vim.keymap.set("n", "<F6>", "<cmd>lua require('dapui').toggle({reset = true})<cr>")
    vim.keymap.set("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
    vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>")
    vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>")
    vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>")


    lvim.builtin.which_key.mappings["t"] = {
        name = "Trouble",
        r = { "<cmd>Trouble lsp_references<cr>", "References" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
        d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
        q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
        l = { "<cmd>Trouble loclist<cr>", "LocationList" },
        w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
    }

    lvim.builtin.which_key.mappings["f"] = {
        name = "File Search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Find Project Files" },
        F = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find All Files" },
        t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern In All Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }
    }
    -- lvim.builtin.which_key.mappings["d"] = {}
    lvim.lsp.buffer_mappings.normal_mode['gr'] = {
        "<cmd>Telescope lsp_references<cr>", "References"
    }

    lvim.lsp.buffer_mappings.normal_mode['gI'] = {
        "<cmd>Telescope lsp_implementations<cr>", "Implementations"
    }
    lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
    vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
    vim.keymap.set("n", "gq", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
end
return M
