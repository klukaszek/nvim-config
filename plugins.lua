require("custom.mappings")
require("custom.options")

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "glsl-analyzer",
        "jdtls",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "wgsl-analyzer",
        "tailwind-css-language-server",
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

-- Set syntax highlighting for cup and flex files
autocmd("BufRead", {
  pattern = {"*.cup", "*.flex"},
  callback = function()
    opt.filetype = "cup"
  end,
})

return plugins
