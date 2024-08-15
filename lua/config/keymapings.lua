local M = {}
M.setup = function()
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
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
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
