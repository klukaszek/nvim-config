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
                "glsl_analyzer",
                "jdtls",
                "html-lsp",
                "css-lsp",
                "typescript-language-server",
                "wgsl-analyzer",
                "tailwindcss-language-server",
                "rust-analyzer",
                "lua-language-server",
                "ocamlformat",
                "marksman",
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
}

autocmd = vim.api.nvim_create_autocmd
opt = vim.opt

-- Set syntax highlighting for wgsl files
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
        opt.filetype = "wgsl"
    end,
})

-- Set syntax highlighting for cup and flex files
autocmd("BufRead", {
    pattern = { "*.cup", "*.flex" },
    callback = function()
        opt.filetype = "cup"
    end,
})

return plugins
