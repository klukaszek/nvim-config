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
        lazy = false,
        config = function()
            require('render-markdown').setup({})
        end,
    }
}

-- Treesitter Setup for my commonly used languages
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (supported parsers can be found here: 
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "latex",
    "lua",
    "vim",
    "javascript",
    "typescript",
    "python",
    "c",
    "cpp",
    "java",
    "html",
    "css",
    "json",
    "yaml",
    "rust",
    "bash",
    "wgsl",
    "glsl",
    "hlsl",
    "slang",
    "sql"
    -- Add any other languages you commonly use
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true
  },
}

return plugins
