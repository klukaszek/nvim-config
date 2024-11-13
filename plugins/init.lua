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
      require("copilot").setup {
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
      }
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
      require("render-markdown").setup {}
    end,
  },
}

-- import treesitter.parsers
local parsers = require("nvim-treesitter.parsers")

-- if parsers basic parsers are installed, skip the treesitter setup
-- for whatever reason, treesitter keeps trying to install parsers even if they are already installed
if parsers.get_parser_configs().bash then
    if parsers.get_parser_configs().c then
        if parsers.get_parser_configs().python then
            if parsers.get_parser_configs().lua then
                return plugins
            end
        end
    end
end

-- Treesitter Setup for my commonly used languages
require("nvim-treesitter.configs").setup {
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
    "sql",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
}
return plugins
