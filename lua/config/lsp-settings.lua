local M = {}
M.setup = function()
    vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

    local lsp_manager = require "lvim.lsp.manager"
    -- lsp_manager.setup("golangci_lint_ls", {
    --     on_init = require("lvim.lsp").common_on_init,
    --     capabilities = require("lvim.lsp").common_capabilities(),
    -- })
    --
    lsp_manager.setup("gopls", {
        on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            local _, _ = pcall(vim.lsp.codelens.refresh)
            local map = function(mode, lhs, rhs, desc)
                if desc then
                    desc = desc
                end

                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
            end
            map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
            map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
            map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
            map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
            map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
            map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
            map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
            map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
            map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
        end,
        on_init = require("lvim.lsp").common_on_init,
        capabilities = require("lvim.lsp").common_capabilities(),
        settings = {
            gopls = {
                gofumpt = true,
                analyses = {
                    unusedparams = true,
                },
                completeUnimported = true,
                usePlaceholders = true,
                staticcheck = true,
                buildFlags = { "-tags=unit restapi mysqllib integration" },
                semanticTokens = true,
                codelenses = {
                    generate = false,
                    gc_details = true,
                    test = true,
                    tidy = true,
                },
            },
        },
    })
end
return M
