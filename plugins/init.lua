local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "jdtls",
                "html-lsp",
                "css-lsp",
                "typescript-language-server",
                "wgsl-analyzer",
                "tailwindcss-language-server",
                "rust-analyzer",
                "lua-language-server",
                "marksman",
                "python-lsp-server",
                "pylint",
                "glow",
                "ltex-ls",
            },
        },
    },
    {
        "mbbill/undotree",
        lazy = false,
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" }),
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                filetypes = {
                    java = true,
                    flex = true,
                    ["*.flex"] = true,
                    ["*.cup"] = true,
                    ["*.wgsl"] = true,
                },
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    layout = {
                        position = "right",
                        ratio = 0.3,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 100,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
            })
        end,

    },
    {
        "vim-scripts/cup.vim",
        lazy = false,
    },
    {
        "meanderingprogrammer/render-markdown.nvim",
        lazy = true,
        config = function()
            require('render-markdown').setup({})
        end,
    }
}

return plugins
